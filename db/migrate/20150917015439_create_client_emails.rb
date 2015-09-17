class CreateClientEmails < ActiveRecord::Migration
  def change
    create_table :client_emails do |t|
      t.string :email
      t.belongs_to :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
