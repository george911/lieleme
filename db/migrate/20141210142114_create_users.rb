class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :mobile
      t.string :user_name
      t.string :true_name
      t.string :user_type
      t.string :email
      t.integer :base_salary
      t.integer :month_num
      t.integer :bonus
      t.integer :housing
      t.integer :transport
      t.string :stock
      t.integer :stock_num
      t.integer :retention_bonus
      t.integer :expect_package
      t.integer :expect_month_salary
      t.date :birthday
      t.string :city
      t.string :title

      t.timestamps
    end
  end
end
