class AddColumnToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :commission, :integer
  end
end
