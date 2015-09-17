class RemoveClientEmail < ActiveRecord::Migration
  def change
    drop_table :client_emails
  end
end
