class AddJobEmployerToInvitation < ActiveRecord::Migration
  def change
    add_column :invitations,:job_employer,:string
  end
end
