class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if authenticate_user!
  end

end
