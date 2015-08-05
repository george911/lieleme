class JobRate < ActiveRecord::Base
  # 为了active_admin能够运行，所以建立这个model
  belongs_to :job
  ratyrate_rateable "job_general"
  ratyrate_rateable "speed"
end
