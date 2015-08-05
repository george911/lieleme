class AddUptonowToUsers < ActiveRecord::Migration
  def change
    add_column :works,:uptonow,:boolean
  end
end
