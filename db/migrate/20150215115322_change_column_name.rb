class ChangeColumnName < ActiveRecord::Migration
  def change
    remove_column :inquiries, :type
    add_column	:inquiries, :inquiry_type,:string
  end
end
