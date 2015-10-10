class AddYearToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates,:age,:integer
    remove_column :candidates,:profile
  end
end
