class AddAndRemoveMailHistory < ActiveRecord::Migration
  def change
    add_column :mail_histories,:status,:string
    add_column :mail_histories,:content,:text
  end
end
