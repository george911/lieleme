class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :author
      t.integer :author_id
      t.boolean :top
      t.text :body
      t.integer :rating
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
