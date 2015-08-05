class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.string :author
      t.boolean :top
      t.belongs_to :job, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
