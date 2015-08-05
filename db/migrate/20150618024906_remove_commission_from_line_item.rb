class RemoveCommissionFromLineItem < ActiveRecord::Migration
  def change
    remove_column :line_items,:commission
  end
end
