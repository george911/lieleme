class BossesController < ApplicationController
before_action :set_boss
before_action :set_job

def update
    @boss.update(boss_params)
      respond_to do |format|
      format.js 
    end
    
end

def destroy
    @boss = Boss.find(params[:id])
    @boss.destroy
    respond_to do |format|
      format.html 
      format.js
    end
end

  private
  def set_boss
    @boss = Boss.find(params[:id])
  end
  
  def boss_params
    params.require(:boss).permit(:title)
  end

  def set_job
    @job = Job.find(params[:job_id])
  end
end
