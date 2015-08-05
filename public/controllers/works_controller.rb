class WorksController < ApplicationController
  before_action :set_work, only: [:update]  
  before_action :set_user, only: [:update,:edit]
  
  def new
  end

  def edit 
    @works = @user.works.all
    respond_to do |format|
      format.html { render :edit }
      format.js 
      end
  end

  def create
  end

  def update
    @work.update(work_params)
    respond_to do |format|
     format.js 
    end
    
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
  
  def work_params
    params.require(:work).permit(:title,:employer,:industry,:job_scope,:join_date,:leave_date)
  end

  def set_work
    @work = Work.find(params[:id])
  end
end
