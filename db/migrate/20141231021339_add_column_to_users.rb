class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users,:industry,:string
    add_column :users,:focus_job1,:string
    add_column :users,:focus_job2,:string
    add_column :users,:focus_job3,:string
  end
end
