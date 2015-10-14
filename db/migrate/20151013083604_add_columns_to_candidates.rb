class AddColumnsToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates,:follwers,:integer
    add_column :candidates,:year,:integer
  end
end
