class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :addr
      t.string :city
      t.string :industry
      t.integer :commission
      t.text :role
      t.text :requirement
      t.integer :base_pay
      t.integer :month
      t.string :bonus
      t.integer :allowance
      t.string :stock
      t.integer :stock_num
      t.date :concall_date
      t.integer :user_id
      t.string :peer
      t.text :memo
      t.text :company_info
      t.integer :work_year

      t.timestamps
    end
  end
end
