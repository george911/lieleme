class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.integer :recipient_id
      t.integer :sender_id
      t.integer :job_id
      t.boolean :accept
      t.datetime :datetime
      t.string :address
      t.text :content

      t.timestamps
    end
  end
end
