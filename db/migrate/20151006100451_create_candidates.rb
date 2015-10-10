class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :title
      t.string :employer
      t.string :mobile
      t.string :email
      t.string :city
      t.string :note
      t.string :profile
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
