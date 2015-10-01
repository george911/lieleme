class MinimumJobId < ActiveRecord::Migration
  def change
    execute "SELECT setval('jobs_id_seq', 1000);"
  end
end
