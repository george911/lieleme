class AddEmailAccoutToUser < ActiveRecord::Migration
  def change
    add_column :users,:email_account, :string
    add_column :users,:email_password,:string
    add_column :users,:email_address, :string
  end
end
