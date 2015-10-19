class AddToMailHistory < ActiveRecord::Migration
  def change
    add_column :mail_histories,:email,:string
  end
end
