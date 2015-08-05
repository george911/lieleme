class ChangeColumnType < ActiveRecord::Migration
  def change
    remove_column :interviews,:datetime,:datetime
    add_column :interviews,:datetime,:text
  end
end
