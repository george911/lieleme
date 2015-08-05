class EducationsController < ApplicationController
  before_action :set_education, only: [:update] # form_for([@user,education])会传递:id参数
  before_action :set_user, only: [:update,:edit]
  def new
  end
  
  def create
  end

  def edit
    @educations = @user.educations.all
    respond_to do |format|
      format.html { render :edit }
      format.js
      end
  end

  def update
    @education.update(education_params)
      respond_to do |format|
        format.js 
      end
  end

  def destroy
  end
  
  private
  def set_user
    @user = User.find(params[:user_id])
  end
  
  def education_params
    params.require(:education).permit(:school,:enter_school,:leave_school,:major,:degree,:uptonow)
  end

  def set_education
    @education = Education.find(params[:id])
  end
end
