class Jobs::BuildController < ApplicationController
  include Wicked::Wizard
  before_action :set_job
  layout 'home'
  steps :job_scope, :team, :package, :invitation
  def show
    case step
    when :invitation
      @hunters = User.where("user_type = '猎头'").sort_by{ |hunter| hunter.match_point(@job) }.reverse.first(3)
      @job.microposts.create(content:"我发布了#{@job.title}职位",job_id:@job.id,user_id:current_user.id) 
    end
    render_wizard
  end
  
  def update
    @job.update_attributes(job_params)
    #@job.user_id = current_user.id 放到jobs controller更安全
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
        :title, :interview,:addr, :city, :industry, :commission, 
	:role, :requirement, :work_year,
	:base_pay, :month, :bonus, :allowance, :stock, :stock_num, :concall_date,
   	experiences_attributes:[:skill,:year,:_destroy],
   	bosses_attributes: [:title, :job_id,:_destroy],
	subordinates_attributes: [:job_id,:title,:num, :_destroy],
	experiences_attributes: [:skill,:year,:_destroy]
    )
  end
end
