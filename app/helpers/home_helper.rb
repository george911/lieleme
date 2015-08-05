module HomeHelper
  def my_refers_link(job_id)
    if current_user.line_items.where(job_id:job_id).nil?
      link_to "0"
    else
      link_to '#{current_user.line_items.where(job_id:job_id).count}',my_referals_path(job_id:job_id) 
    end
  end
end


