class MicropostsController < ApplicationController
  require 'rqrcode'
  before_action :prepare_for_mobile, only: :show
  before_action :authenticate_user!,only:[:new,:create,:destroy]
  before_action :correct_user,   only: :destroy
  before_action :set_micropost, only:[:show,:destroy]
  layout "blog"

  def home
    @user = User.find(params[:id])
  end

  def new
    @micropost = Micropost.new
  end
  
  def create
    @micropost = current_user.microposts.new(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'front/home'
    end
  end

  def show
    session[:show] = true 
    @user = @micropost.user
    if Rails.env.production?
 	@qr = RQRCode::QRCode.new("http://www.lieleme.com/cn/microposts/#{@micropost.id}", :size => 8, :level => :h )
    else
	@qr = RQRCode::QRCode.new("http://192.168.0.100:3000/cn/microposts/#{@micropost.id}", :size => 8, :level => :h )
    end
    respond_to do |format|
      format.html
      format.mobile
    end
  end

  def index
    @microposts = Micropost.all
  end

  def destroy
    @micropost.destroy
      flash[:success] = "Micropost deleted"
      if session[:show] == true
	redirect_to blog_home_path(current_user)
      else
	redirect_to request.referrer || root_url
      end
  end

  private
    def set_user
      @user = User.find(params[:user_id])
    end
    
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    def micropost_params
      params.require(:micropost).permit(:content,:title,:avatar)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
