class AddColToUser < ActiveRecord::Migration
  def change
   add_column :users,:bank_id,:integer
  end
end
