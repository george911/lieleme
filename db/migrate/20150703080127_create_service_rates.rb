class CreateServiceRates < ActiveRecord::Migration
  def change
    create_table :service_rates do |t|
      t.belongs_to :line_item, index: true

      t.timestamps
    end
  end
end
