class FrontController < ApplicationController
  skip_before_action :authenticate_user! #devise认证user

  def show
    @offers=LineItem.where("status = ?","offer")#where能够取出然后使用.each函数,find_by不能
    @first_offer=LineItem.where("status = ?","offer").order('created_at asc').first
    @offer = LineItem.find(params[:offer_id]) if params[:offer_id].present?

    respond_to do |format|
    format.html {
      if user_signed_in?
        @micropost = current_user.microposts.build if authenticate_user!
        @feed_items = current_user.feed.page(params[:page]).per(10)
        @my_invites = current_user.received_invitations
        render 'home'
      else
        render 'before_signin'
      end }
    format.js
    end
  end
end
