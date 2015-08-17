class ChangeDatetimeFormat < ActiveRecord::Migration
  def change
    remove_column :interviews,:datetime,:text
    add_column :interviews,:datetime,:datetime
  end
end
