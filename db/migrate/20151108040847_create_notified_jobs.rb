class CreateNotifiedJobs < ActiveRecord::Migration
  def change
    create_table :notified_jobs do |t|

      t.timestamps null: false
    end
  end
end
