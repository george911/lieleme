class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :mobile
      t.string :email
      t.string :name
      t.string :title
      t.string :status
      t.string :city
      t.integer :talent_id
      t.belongs_to :user, index: true
      t.belongs_to :job, index: true

      t.timestamps
    end
  end
end
