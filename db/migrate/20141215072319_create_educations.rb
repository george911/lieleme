class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :school
      t.date :enter_school
      t.date :leave_school
      t.string :major
      t.string :degree
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
