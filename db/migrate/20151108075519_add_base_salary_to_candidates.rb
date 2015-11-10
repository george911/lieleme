class AddBaseSalaryToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates,:base_salary,:integer
  end
end
