class AddJobIdToRooms < ActiveRecord::Migration
  def change
    add_column :rooms,:job_id,:integer
  end
end
