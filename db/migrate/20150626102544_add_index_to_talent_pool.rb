class AddIndexToTalentPool < ActiveRecord::Migration
  def change
    add_index :talent_pools, :talent_id
    add_index :talent_pools, :hunter_id
    add_index :talent_pools, [:talent_id,:hunter_id],unique: true
  end
end
