class SummariesController < ApplicationController
  before_action :set_summary, only: [:update] # form_for([@user,education])会传递:id参数
  before_action :set_user, only: [:update,:edit]
  def edit
    @summaries = @user.summaries.all
    respond_to do |format|
      format.html { render :edit }
      format.js
      end
  end

  def update
    @summary.update(summary_params)
      respond_to do |format|
        format.js 
      end
  end
  private
  def set_user
    @user = User.find(params[:user_id])
  end
  
  def summary_params
    params.require(:summary).permit(:content)
  end

  def set_summary
    @summary = Summary.find(params[:id])
  end
end
