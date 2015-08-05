class DropRatingTable < ActiveRecord::Migration
  def change
    drop_table :rating_caches
    drop_table :rates
  end
end
