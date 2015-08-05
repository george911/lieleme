class Jobs::BuildController < ApplicationController
  include Wicked::Wizard
  before_action :set_job
  steps :job_scope, :team, :package
  def show

    render_wizard
  end
  
  def update
    @job.update_attributes(job_params)
    @job.user_id = current_user.id
    render_wizard @job
  end
 
  def finish_wizard_path
    job_path(@job)
  end

  private
  def set_job
      @job = Job.find(params[:job_id])
  end

  def job_params
    params.require(:job).permit(
        :title, :addr, :city, :industry, :commission, 
	:role, :requirement, :work_year,
	:base_pay, :month, :bonus, :allowance, :stock, :stock_num, :concall_date,
   	experiences_attributes:[:skill,:year,:_destroy],
   	bosses_attributes: [:title, :job_id,:_destroy],
	subordinates_attributes: [:job_id,:title,:num, :_destroy],
	experiences_attributes: [:skill,:year,:_destroy]
    )
  end
end
