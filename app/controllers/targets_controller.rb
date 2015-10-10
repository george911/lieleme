class TargetsController < ApplicationController
before_action :set_target
before_action :set_job

def update
    @target.update(target_params)
      respond_to do |format|
      format.js 
    end
    
  end
  private
  def set_target
    @target = Target.find(params[:id])
  end
  
  def target_params
    params.require(:target).permit(:name,:city,:department)
  end

  def set_job
    @job = Job.find(params[:job_id])
  end
end
