class AddAttachmentAvatarToMicroposts < ActiveRecord::Migration
  def self.up
    change_table :microposts do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :microposts, :avatar
  end
end
