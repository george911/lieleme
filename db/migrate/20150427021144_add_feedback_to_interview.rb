class AddFeedbackToInterview < ActiveRecord::Migration
  def change
    add_column :interviews,:feedback,:text
  end
end
