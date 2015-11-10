class AddTagToJob < ActiveRecord::Migration
  def change
    add_column :jobs,:tag1,:string
    add_column :jobs,:tag2,:string
    add_column :jobs,:tag3,:string
  end
end
