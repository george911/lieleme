class TalentPoolsController < ApplicationController
  before_action :authenticate_user!,only:[:create,:destroy]
  before_action :set_user
  
  def create
    current_user.send_resume(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end

