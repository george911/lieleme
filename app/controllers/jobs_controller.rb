class JobsController < ApplicationController
  require 'rqrcode'
  before_action :prepare_for_mobile, only: :show
  before_action :clear_session, except: [:create]
  before_action :set_job, except: [:batch_job,:index,:new,:create,:apply]
  layout 'home',except:[:index,:show,:apply] # 因为moadal不能放在layout:home下面
#  load_and_authorize_resource
  skip_before_action :authenticate_user!,only: [:show,:show_job_on_mobile,:show_company_on_mobile]
  skip_before_action :prepare_for_mobile, only:[:show_job_on_mobile,:show_company_on_mobile]
  skip_load_resource :only => [:apply]

  # GET /jobs
  # GET /jobs.json
  def batch_job
    @job = Job.new
    session[:batch_job] = true
  end
  
  def save
    current_user.saving(@job)
    respond_to do |format|
      format.html { 
        redirect_to @job,notice: "收藏成功"}
      format.js
    end
  end
 
  def index
    @jobs = Job.all.order("created_at desc").page(params[:page]).per(10) # params[:page]不用设置
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @talent=nil
    @line_item = LineItem.new # form_for @line_item要用
    @line_items = LineItem.where("job_id = ?",@job.id).take(100) #加unless @line_items == nil是错误的，赋值之前永远为nil
    if current_user != nil
      #如果有评论且是登录者的就赋给@comment,否则新建一个
      @comment = @job.comments.present? ? (@job.comments.find_by(user_id:current_user.id) or Comment.new) : Comment.new
     else
       @comment = Comment.new 
     end
     if current_user
	if Rails.env.production?
	  @qr = RQRCode::QRCode.new( "http://www.lieleme.com/cn/jobs/#{@job.id}?utf8=✓&forwarder=#{current_user.id}", :size => 8, :level => :h )
	else
	  @qr = RQRCode::QRCode.new( "http://192.168.0.100:3000/cn/jobs/#{@job.id}?utf8=✓&forwarder=#{current_user.id}", :size => 8, :level => :h )
	end
     end
     if mobile_device? and params[:forwarder].present?
	@forwarder = User.find(params[:forwarder]) 
     end
     respond_to do |format|
       format.html { render :show }
       format.mobile
     end
  end

  def show_job_on_mobile
    @line_item = LineItem.new # form_for @line_item要用
    @forwarder = User.find(params[:forwarder]) unless params[:forwarder]== nil
    respond_to do |format|
      format.js
      end
  end

  def show_company_on_mobile
    respond_to do |format|
      format.js
      end
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
    respond_to do |format|
      format.html { render :edit }
      format.js 
      end
  end

  def edit_targets
    @targets = @job.targets.all
    respond_to do |format|
      format.html { }
      format.js
    end
  end

  def edit_sub
    @subordinates = @job.subordinates.all
    respond_to do |format|
      format.html { render :edit }
      format.js
      end
  end

  def edit_bosses
    @bosses = @job.bosses.all
    respond_to do |format|
      format.html { render :edit }
      format.js
    end
  end
  
  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    @job.poster_id = current_user.id
    respond_to do |format|
      if @job.save
	format.html { 
	  if session[:batch_job] == true
	    redirect_to batch_job_path
	  else
	     redirect_to job_build_path(job_id: @job.id, id: :job_scope)
	  end }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

 def apply
   @job = Job.find(params[:job_id])
   @job.line_items.where.not(recipient_id:nil).each do |f|
     f.mark_as_read! :for => current_user
   end
   
   respond_to do |format|
      format.html { } # 此处用render partial,则bootstrap javastript不能用，所以用与action同名view的好处就在这里
      format.js
      format.json { render partial: 'apply', status: :created, location: @job }
    end
  end
  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def clear_session
      session[:batch_job] = nil
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:origin,:status,:avatar,:title, :interview,:employer,:addr, :city, :industry, :commission, :role, :requirement, :base_pay, :month, :bonus, :allowance, :stock, :stock_num, :concall_date, :user_id, :peer, :memo, :company_info, :work_year,
	experiences_attributes:[:skill,:year,:_destroy],
   	bosses_attributes: [:title, :job_id,:_destroy],
	subordinates_attributes: [:job_id,:title,:num, :_destroy],
	experiences_attributes: [:skill,:year,:_destroy]
				 )
    end
end
