class AddCandidateIdToMailHistory < ActiveRecord::Migration
  def change
    add_column :mail_histories,:candidate_id,:integer
  end
end
