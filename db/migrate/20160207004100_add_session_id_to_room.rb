class AddSessionIdToRoom < ActiveRecord::Migration
  def change
    add_column :rooms,:session_id,:string
  end
end
