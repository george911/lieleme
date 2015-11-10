class AddNotifiedToJob < ActiveRecord::Migration
  def change
    add_column :jobs,:notified,:boolean
  end
end
