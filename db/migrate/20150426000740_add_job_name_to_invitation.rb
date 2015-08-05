class AddJobNameToInvitation < ActiveRecord::Migration
  def change
    add_column :invitations, :job_title,:string
  end
end
