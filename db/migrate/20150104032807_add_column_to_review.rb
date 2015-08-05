class AddColumnToReview < ActiveRecord::Migration
  def change
    add_column :reviews,:employer,:string
    add_column :reviews,:title,:string
  end
end
