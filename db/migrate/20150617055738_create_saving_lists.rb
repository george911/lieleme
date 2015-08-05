class CreateSavingLists < ActiveRecord::Migration
  def change
    create_table :saving_lists do |t|
      t.integer :user_id
      t.integer :job_id

      t.timestamps
    end
  end
end
