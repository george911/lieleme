class AddFeedbckToLineitem < ActiveRecord::Migration
  def change
    add_column :line_items,:feedback,:text
  end
end
