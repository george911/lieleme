class AddOriginToJob < ActiveRecord::Migration
  def change
    add_column :jobs,:origin,:string
  end
end
