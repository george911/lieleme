class AddCommentToLineitem < ActiveRecord::Migration
  def change
    add_column :line_items,:comment,:text
  end
end
