class AddColToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items,:interviewed,:boolean
  end
end
