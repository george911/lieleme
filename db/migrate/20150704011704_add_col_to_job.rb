class AddColToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :interview,:boolean
  end
end
