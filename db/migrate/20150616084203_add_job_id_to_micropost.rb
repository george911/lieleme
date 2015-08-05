class AddJobIdToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts,:job_id,:integer
  end
end
