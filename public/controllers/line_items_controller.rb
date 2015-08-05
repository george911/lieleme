class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :set_job

  def accept 
    # 检查是否有人应聘
    if @job.line_items.present? 
      @job.line_items.each do |line_item|
          if line_item.mobile==current_user.mobile or line_item.email==current_user.email #找到推荐信
            line_item.talent_id = current_user.id 
	    current_user.bank_id = line_item.user_id if current_user.bank_id.blank? # 用empty会出现nil class的问题
            line_item.status = "等待反馈"
	    line_item.save
  	    current_user.save
	    break #找到推荐信就跳出循环，否则下面会重复推荐
  	  elsif line_item==@job.line_items.last#整个循环都没找到推荐信,要自己创建line_item,说明是自聘
    	    @line_item=@job.line_items.build(user_id:current_user.id,talent_id:current_user.id)#推荐人和候选人是一个人
            @line_item.status = "等待反馈"
            @line_item.save
  	    break #跳出循环，否则会无穷创建推荐
  	  end
      end
    else # 没人应聘，自聘
      @line_item=@job.line_items.build(user_id:current_user.id,talent_id:current_user.id,status:"等待反馈")
      @line_item.save
    end

    respond_to do |format|
      format.html { redirect_to @job, notice: '应聘成功' }
      format.js
      format.json { render partial: 'apply', status: :created, location: @job }      #刷新apply的列表,必须建立view/jobs/accept.js.erb文件
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

  # POST /line_items
  # POST /line_items.json
  def create
    @user = current_user
    @talent = User.find(session[:talent_id]) if session[:talent_id].present? # 如果没有母类，不能承载.empty?函数

    # 这个职位推荐过人 
    if @job.line_items.present?
        # 查找有无重复推荐候选人
        @job.line_items.each do |f|
           # 外部推荐
	   if params[:line_item].present? # params[:line_item][:mobile] != nil 不对，因为params[:line_item]为空会报错
	      # 从外部推荐,发生候选人在这个职位上重合了
	      if (f.mobile == params[:line_item][:mobile] && f.mobile.present?) or (f.email == params[:line_item][:email] && f.email.present?) 
         	  redirect_to job_path(@job), notice: '不好意思，这个职位已经有人推荐了，继续努力哦' and return
	      end
	   # 内部推荐
	   else 	
	      if @talent.present? # 从内部推荐
    	          if (f.mobile==@talent.mobile && f.mobile.present?) or (f.email==@talent.email && f.email.present?) 
    	            redirect_to @talent, notice: '亲,您晚了一步，这个职位候选人已经应聘了' and return
		  end
	      end 
	   end
        end # 循环结束
    end 
    # 候选人来自外部且没有与简历库重合, 优先登记
    if params[:line_item].present?
    	# 从外部推荐,和库里面的候选人重合,从外部推荐变成内部推荐
  	if User.find_by(email:params[:line_item][:email]) # 哥，不能用or并列赋值
	   @talent  = User.where(email: params[:line_item][:email]).take
	   @line_item=@user.line_items.build(job_id:@job.id,talent_id:@talent.id,mobile:@talent.mobile,email:@talent.email,name:@talent.true_name,title:@job.title,status:"等待应聘",city:@talent.city) 
	elsif User.find_by(mobile:params[:line_item][:mobile])
	   @talent  = User.where(mobile: params[:line_item][:mobile]).take
	   @line_item=@user.line_items.build(job_id:@job.id,talent_id:@talent.id,mobile:@talent.mobile,email:@talent.email,name:@talent.true_name,title:@job.title,status:"等待应聘",city:@talent.city) 
        # 候选人是从库外新鲜加入的
	else	
	   @line_item = @user.line_items.build(line_item_params)
	end
    # 候选人来自内部 
    elsif @talent.present? and session[:talent_id].present?
	  @line_item=@user.line_items.build(job_id:@job.id,talent_id:session[:talent_id],mobile:@talent.mobile,email:@talent.email,name:@talent.true_name,title:@job.title,status:"等待应聘",city:@talent.city) 
    end
  
    # line_item_params里面没有job_id，所以需要在这里单独给@line_item赋job_id
    @line_item.job_id = params[:job_id] unless session[:talent_id].present? # 内部推荐不需要   
    @line_item.status = "等待应聘"
    @line_item.commission = @job.commission
    ReferNotifier.refer(@line_item).deliver unless @line_item.email==nil
    
    respond_to do |format|
      if @line_item.save
        format.html { 
	  if params[:line_item].present?
	   	if User.find_by(email:params[:line_item][:email]) or User.find_by(mobile:params[:line_item][:mobile])
	    	  redirect_to @talent, notice: "恭喜您成功推荐以下候选人到#{@job.title}职位"
		else
		   redirect_to job_line_item_path(id:@line_item.id), notice: '您已经成功推荐'
	   	end 
	  else  
		redirect_to @talent, notice:"恭喜您成功推荐以下候选人到#{@job.title}职位"
	  end}
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
      if params[:status] != nil
	@line_item.update(feedback:params[:feedback],status:params[:status])
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
      params.require(:line_item).permit(:mobile, :email, :name, :city,:user_id,:talent_id,:title,:status,:job_id)
    end
end
