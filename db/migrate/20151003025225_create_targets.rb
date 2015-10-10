class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.string :name
      t.string :city
      t.string :department
      t.belongs_to :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
