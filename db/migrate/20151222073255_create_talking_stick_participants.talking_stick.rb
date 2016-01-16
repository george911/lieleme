# This migration comes from talking_stick (originally 20150510182258)
class CreateTalkingStickParticipants < ActiveRecord::Migration
  def change
    create_table :talking_stick_participants do |t|
      t.string :name
      t.string :ip
      t.string :guid, index: true
      t.timestamp :joined_at
      t.timestamp :last_seen
      t.belongs_to :room, index: true

      t.timestamps null: false
    end
  end
end
