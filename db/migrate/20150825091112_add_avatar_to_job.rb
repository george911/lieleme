class AddAvatarToJob < ActiveRecord::Migration
  def up
    add_attachment :jobs, :avatar
  end

  def down
    remove_attachment :jobs, :avatar
  end
end
