class AddCandidateId < ActiveRecord::Migration
  def change
    add_column :notified_jobs,:candidate_id,:integer
  end
end
