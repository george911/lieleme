class AddNoteToClient < ActiveRecord::Migration
  def change
    add_column :clients, :note,:text
  end
end
