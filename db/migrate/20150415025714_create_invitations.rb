class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :recipient_id
      t.integer :sender_id
      t.integer :job_id

      t.timestamps
    end
  end
end
