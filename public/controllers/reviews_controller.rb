class ReviewsController < ApplicationController
  before_action :set_review, only:[:show, :update, :destroy] #之所以edit不需要set_review是因为edit会通过author_id找到那条记录，而edit时路径不变又不允许他把参数放到路径里
  before_action :set_user, only:[:new,:create,:edit,:update] #找到user(即评论对象)
  before_action :authenticate_user! #devise认证user

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @user = User.find(params[:user_id]) #找到评价对象
    @review = Review.new
  end

  def create
     @review = @user.reviews.build(employer:params[:review][:employer], author_id:current_user.id,author:current_user.user_name,body:params[:review][:body],rating:params[:review][:rating],top:params[:review][:top])
    #@review = Review.new(review_params)

    if @review.save
      redirect_to @user,notice:'点评成功'
    else
      render 'new'
    end
  end
  
  # GET /reviews/1/edit
  def edit
    @review = @user.reviews.find_by(author_id:current_user.id)
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @user, notice: '评价更新成功' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:author, :author_id, :top, :body, :rating, :user_id, :employer, :title)
    end
end
