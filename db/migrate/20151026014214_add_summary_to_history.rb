class AddSummaryToHistory < ActiveRecord::Migration
  def change
    add_column :mail_histories,:total_num,:integer
    add_column :mail_histories,:sent_num,:integer
  end
end
