class AddIndexJobsOnUserId < ActiveRecord::Migration
  def change
    change_table(:jobs) do |t|
    add_index :jobs,:user_id
    end
  end
end
