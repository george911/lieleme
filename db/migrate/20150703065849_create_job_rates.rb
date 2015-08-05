class CreateJobRates < ActiveRecord::Migration
  def change
    create_table :job_rates do |t|
      t.belongs_to :job, index: true

      t.timestamps
    end
  end
end
