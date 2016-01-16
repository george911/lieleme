class AddTagList < ActiveRecord::Migration
  def change
    add_column :candidates,:tag_list,:string
  end
end
