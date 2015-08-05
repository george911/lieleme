class AddColumnToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :sender_id, :integer
    add_column :line_items, :recipient_id, :integer
  end
end
