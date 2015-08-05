json.array!(@users) do |user|
  json.extract! user, :id, :mobile, :user_name, :true_name, :user_type, :email, :base_salary, :month_num, :bonus, :housing, :transport, :stock, :stock_num, :retention_bonus, :expect_package, :expect_month_salary, :birthday, :city, :title
  json.url user_url(user, format: :json)
end
