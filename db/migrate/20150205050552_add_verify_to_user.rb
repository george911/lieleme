class AddVerifyToUser < ActiveRecord::Migration
  def change
    add_column :users,:verify,:string
  end
end
