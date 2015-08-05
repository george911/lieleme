class CreateBosses < ActiveRecord::Migration
  def change
    create_table :bosses do |t|
      t.string :title
      t.belongs_to :job, index: true

      t.timestamps
    end
  end
end
