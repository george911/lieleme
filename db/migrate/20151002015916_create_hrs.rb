class CreateHrs < ActiveRecord::Migration
  def change
    create_table :hrs do |t|
      t.string :name
      t.string :title
      t.string :email
      t.string :phone
      t.belongs_to :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
