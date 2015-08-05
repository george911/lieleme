class SetInviteStatusDefault < ActiveRecord::Migration
  def change
    remove_column :invitations,:status
    add_column :invitations,:status,:string,default:"active"
  end
end
