class CreateMailHistories < ActiveRecord::Migration
  def change
    create_table :mail_histories do |t|
      t.string :name
      t.string :title
      t.integer :year
      t.string :city
      t.string :employer
      t.integer :job_id
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
