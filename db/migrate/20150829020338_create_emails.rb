class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :name
      t.string :email
      t.string :skill
      t.string :city
      t.integer :year
      t.timestamps null: false
    end
  end
end
