class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :skill
      t.integer :year
      t.belongs_to :job, index: true

      t.timestamps
    end
  end
end
