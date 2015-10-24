class SubordinatesController < ApplicationController
before_action :set_sub
before_action :set_job

def update
    @sub.update(sub_params)
      respond_to do |format|
      format.js 
    end
    
end

def destroy
    @subordinate = Subordinate.find(params[:id])
    @subordinate.destroy
    respond_to do |format|
	format.html
	format.js
    end
end

  private
  def set_sub
    @sub = Subordinate.find(params[:id])
  end
  
  def sub_params
    params.require(:subordinate).permit(:title)
  end

  def set_job
    @job = Job.find(params[:job_id])
  end
end
