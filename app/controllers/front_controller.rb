class FrontController < ApplicationController
  skip_before_action :authenticate_user! #devise认证user

  def show
    @offers=LineItem.where("status = ?","offer")#where能够取出然后使用.each函数,find_by不能
    if user_signed_in?
      @micropost = current_user.microposts.build if authenticate_user!
      @feed_items = current_user.feed.page(params[:page]).per(10)
      @my_invites = current_user.received_invitations
      render 'home'
    else
      render 'before_signin'
    end
  end
end
