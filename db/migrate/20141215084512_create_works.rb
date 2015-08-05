class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :title
      t.string :employer
      t.string :industry
      t.date :join_date
      t.date :leave_date
      t.text :job_scope
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
