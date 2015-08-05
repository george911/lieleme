class CreateTalentPools < ActiveRecord::Migration
  def change
    create_table :talent_pools do |t|
      t.integer :hunter_id
      t.integer :talent_id

      t.timestamps
    end
  end
end
