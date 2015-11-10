class AddJobIdToNotified < ActiveRecord::Migration
  def change
    add_column :notified_jobs,:job_id,:integer
  end
end
