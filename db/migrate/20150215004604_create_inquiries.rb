class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :name
      t.string :employer
      t.string :title
      t.string :type
      t.string :mobile
      t.string :email
      t.text :content

      t.timestamps
    end
  end
end
