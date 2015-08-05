class CreateSubordinates < ActiveRecord::Migration
  def change
    create_table :subordinates do |t|
      t.string :title
      t.integer :num
      t.belongs_to :job, index: true

      t.timestamps
    end
  end
end
