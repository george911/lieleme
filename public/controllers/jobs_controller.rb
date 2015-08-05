class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all.page(params[:page]).per(10) # params[:page]不用设置
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @poster=User.find(@job.user_id) #发布者id
    #session[:talent_id]=nil
    @talent=nil
    @line_item = LineItem.new # form_for @line_item要用
    @line_items = LineItem.where("job_id = ?",@job.id).take(100) #加unless @line_items == nil是错误的，赋值之前永远为nil
    if current_user != nil
      #如果有评论且是登录者的就赋给@comment,否则新建一个
      @comment = @job.comments.present? ? (@job.comments.find_by(user_id:current_user.id) or Comment.new) : Comment.new
     else
       @comment = Comment.new 
     end
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
	format.html { redirect_to job_build_path(job_id: @job.id, id: :job_scope) }
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
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

 def apply
   @job = Job.find(params[:job_id])
   
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
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:title, :addr, :city, :industry, :commission, :role, :requirement, :base_pay, :month, :bonus, :allowance, :stock, :stock_num, :concall_date, :user_id, :peer, :memo, :company_info, :work_year)
    end
end
