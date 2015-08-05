class RemoveColumnToLineItem < ActiveRecord::Migration
  def change
    remove_column :line_items, :title
    remove_column :line_items, :city
    remove_column :line_items, :talent_id
  end
end
