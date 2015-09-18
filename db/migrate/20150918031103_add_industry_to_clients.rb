class AddIndustryToClients < ActiveRecord::Migration
  def change
   add_column :clients,:industry,:string
  end
end
