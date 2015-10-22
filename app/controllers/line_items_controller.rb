class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:reject,:show, :edit, :update, :destroy]
  before_action :set_job, except: :reject
#  load_and_authorize_resource
  skip_load_resource :only => [:create]

  def reject
    @line_item = LineItem.find(params[:id])
    @line_item.update(status:"reject")
    respond_to do |format|
      format.html { redirect_to job_invites_path }
      format.js
    end
  end

  def accept 
    # 检查是否有人应聘
    if @job.line_items.present?
      # apply_valid = @job.talent_accept(current_user) # current_user不能使用在model里，所以要传递进去
      line_item = current_user.accept(@job) # current_user不能使用在model里，所以要传递进去
    else # 没人应聘，自聘
      line_item = @job.line_items.create(interviewed:true,mobile:current_user.mobile,email:current_user.email,sender_id:current_user.id,recipient_id:current_user.id,status:"等待反馈")
    end

    respond_to do |format|
      if line_item 
        @micropost = current_user.microposts.build(content:"我应聘了#{@job.title}职位",user_id:current_user.id,job_id:@job.id)
        @micropost.save
        format.html { redirect_to my_apply_path, notice: ((line_item.interviewed == false and @job.interview == true) ? "在向HR投递前需要对您进行面试,请联系猎头安排" : "应聘成功") }
        format.js
        format.json { render partial: 'apply', status: :created, location: @job }      #刷新apply的列表,必须建立view/jobs/accept.js.erb文件
      else
        format.html { redirect_to @job, notice: '你已经应聘过了' }
        format.js
        format.json { render partial: 'apply', status: :created, location: @job }      #刷新apply的列表,必须建立view/jobs/accept.js.erb文件
      end
    end
  end

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    if session[:talent_id] != nil
	@user = User.find(session[:talent_id]) # 如果没有母类，不能承载.empty?函数.另外session[:talent_id]从users controller refer method里面来
    end
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  def refer
    @talent = User.find(params[:user_id])
    @line_item = current_user.sent_line_items.build(job_id:@job.id, recipient_id:@talent.id,mobile:@talent.mobile,email:@talent.email,name:@talent.user_name,status:"等待应聘")
    
    if @job.duplicate(@talent.mobile, @talent.email)
      redirect_to user_refer_path(@talent), notice:'不好意思, 已经有人推荐过他了'
    elsif @job.interview and @talent.not_interview_by(current_user) # 没面试不让推荐
      redirect_to user_path(@talent), notice:'由于HR只看面试过的候选人,请您在推荐前先面试候选人'
    elsif @line_item.save
      redirect_to job_line_item_path(job_id:@job,id:@line_item), notice:'推荐成功,请督促候选人及早应聘'
    end
  end

  def create
    @user = current_user
    # @talent = User.find(session[:talent_id]) if session[:talent_id].present? # 如果没有母类，不能承载.empty?函数


    if params[:line_item].present?
    	# 从外部推荐,和库里面的候选人重合,从外部推荐变成内部推荐
  	if User.find_by(email:params[:line_item][:email]) and params[:line_item][:email].present?# 哥，不能用or并列赋值
	   @talent  = User.where(email: params[:line_item][:email]).take
	   @line_item=@user.sent_line_items.build(job_id:@job.id,recipient_id:@talent.id,mobile:@talent.mobile,email:@talent.email,name:@talent.user_name,status:"等待应聘") 
	elsif User.find_by(mobile:params[:line_item][:mobile]) and params[:line_item][:mobile].present?
	   @talent  = User.where(mobile: params[:line_item][:mobile]).take
	   @line_item=@user.sent_line_items.build(job_id:@job.id,recipient_id:@talent.id,mobile:@talent.mobile,email:@talent.email,name:@talent.user_name,status:"等待应聘") 
        # 候选人是从库外新鲜加入的
	else	
	   @line_item = @user.sent_line_items.build(line_item_params)
           @line_item.job_id = params[:job_id]   
           @line_item.status = "等待应聘"
	end
    end
  
    respond_to do |format|
    # 查看有无重复推荐
      if params[:line_item].present? and @job.duplicate(params[:line_item][:mobile],params[:line_item][:email])
	  format.html { redirect_to job_path(@job),notice:"不好意思,已经有人推荐他了"}
      elsif @line_item.save
        format.html { 
	  if @talent.present?
	    	  redirect_to @talent, notice: "恭喜您成功推荐以下候选人到#{@job.title}职位"
	  else
		   redirect_to job_line_item_path(id:@line_item.id), notice: '您已经成功推荐以下候选人'
	  end 
    	  if @line_item.email.present?
	    ReferNotifier.refer(@line_item).deliver_now
	  end
	}
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
      session[:talent_id] = nil if session[:talent_id].present?
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
      if params[:status] != nil
	@line_item.update(feedback:params[:feedback],status:params[:status])
    	if @line_item.status == "offer"
	  employer = @job.employer
	  @line_item.recipient.microposts.create(content:"我获得了#{@job.title}职位的offer",job_id:@job.id)
	  
	  @job.recipients.each do |f|
            JobNotifier.pending(f,@job).deliver_now
    	  end 
	end	
      elsif params[:comment] != nil
	@line_item.update(comment:params[:comment])
      end
    respond_to do |format|
        format.html { redirect_to :back, notice: 'Line item was successfully updated.' } # 对应my_jobs下面apply的候选人line_item状态更改后更新
        format.json { render :show, status: :ok, location: @line_item }
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_job
      @job = Job.find(params[:job_id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # line_items/_form里只输入这几项
    def line_item_params
      params.require(:line_item).permit(:interviewed,:mobile, :email, :name, :user_id,:talent_id,:status,:job_id)
    end
end
