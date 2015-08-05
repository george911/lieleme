class AddIndexToSavingLists < ActiveRecord::Migration
  def change
    add_index :saving_lists,[:user_id,:job_id],unique:true
  end
end
