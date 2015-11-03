class UsersController < ApplicationController
  before_action :set_user, only: [:refer,:show, :edit, :update, :destroy,:following,:followers,:send_resume]
  skip_before_action :authenticate_user!,only: [:index,:new,:create] #devise认证user
  #load_and_authorize_resource

 def send_resume
    current_user.send_resume(@user)
    respond_to do |format|
      format.html { redirect_to @user,notice:'简历已发送' }
      format.js
    end
 end

   def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.followings.page(params[:page]).per(10)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(10)
    render 'show_follow'
  end

  def refer
    if params[:id].present?
	session[:talent_id]= params[:id]
    end
    #@talent = User.find(session[:talent_id])
    jobs = Job.all # 这个jobs要在循环外定义,否则会不认
    
    # 筛选出候选人没有应聘过的职位
    line_items = LineItem.where(recipient_id: params[:id])
    line_items.each do |f|
      jobs = jobs.where.not(id:f.job_id)
    end
    @jobs = jobs.page(params[:page]).per(5)
    render 'refer'  
  end

  
  # GET /users
  # GET /users.json
  def index
    session[:build_sum] = false
    @users = User.all.page(params[:page]).per(10)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if current_user 
      @user.mark_as_read! :for => current_user
    end
    @total_apply_num = @user.received_line_items.size
    @fail_num = @user.received_line_items.where(status: "HR拒绝").size
    @microposts = @user.microposts.page(params[:page]).per(10)
    # @offers = @user.received_line_items.where(status: "offer").sum(:commission)
    if current_user != nil
      @review = @user.reviews.present? ? (@user.reviews.find_by(author_id:current_user.id) or Review.new) : Review.new
    else
      @review = Review.new
    end
    # 包括自己的简历和向我推荐职位的人的简历
    if (can? :read, @user) or (current_user == @user) or (current_user.senders.include?(@user))
      case @user.user_type
      when "猎头"
        #@resume_bank = User.where(bank_id: @user.id)
        render 'hunter'
      when "求职者"
        render 'talent' 
      when "人事"
	render "hr"
      end
    else
      redirect_to users_path
    end 
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    respond_to do |format|
      format.html { render :edit }
      format.js 
      end
  end

  def editsalary
    @user = User.find(params[:user_id])
    respond_to do |format|
      format.html { render :edit }
      format.js 
      end
  end
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.js
	format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if params[:id].present?
	@user = User.find(params[:id])
      else
        @user = current_user
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
    params.require(:user).permit(
      :email_account,:email_password,:email_address,
      :tag_list,
      :avatar,
      :mobile, :user_name, :true_name, :user_type, :email, :birthday,:city,:title,
      :base_salary, :month_num, :bonus, :housing, :transport, :stock,:stock_num, 
      :retention_bonus, :expect_package, :expect_month_salary,
      summaries_attributes: [:user_id, :content, :_destroy],
      educations_attributes: [:user_id, :school, :enter_school, :leave_school,
      :major, :degree, :_destroy],
      works_attributes: [:user_id, :title,:employer,:join_date,:leave_date,:industry, :job_scope, :_destroy]
     )
    end
end
