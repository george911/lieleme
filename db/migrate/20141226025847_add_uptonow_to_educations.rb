class AddUptonowToEducations < ActiveRecord::Migration
  def change
    add_column :educations,:uptonow,:boolean
  end
end
