ActiveAdmin.register MailHistory do
  permit_params :name, :title, :year, :city,:employer,:job_id,:email,:content,:status
end

