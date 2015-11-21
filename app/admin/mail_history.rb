ActiveAdmin.register MailHistory do
  permit_params :job_id,:name, :title, :year, :city,:employer,:job_id,:email,:content,:status
end

