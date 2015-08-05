class AddPosterToJob < ActiveRecord::Migration
  def change
    add_column :jobs,:poster_id,:integer
    remove_column :jobs,:user_id
  end
end
