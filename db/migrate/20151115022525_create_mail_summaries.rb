class CreateMailSummaries < ActiveRecord::Migration
  def change
    create_table :mail_summaries do |t|
      t.string :title
      t.string :city

      t.timestamps null: false
    end
  end
end
