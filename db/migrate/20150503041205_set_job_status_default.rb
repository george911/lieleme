class SetJobStatusDefault < ActiveRecord::Migration
  def change
    remove_column :jobs,:status
    add_column :jobs,:status,:string,default:"active"
  end
end
