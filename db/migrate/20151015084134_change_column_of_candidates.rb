class ChangeColumnOfCandidates < ActiveRecord::Migration
  def change
    remove_column :candidates,:follwers
    add_column :candidates,:followers,:integer
  end
end
