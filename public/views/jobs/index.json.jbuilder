json.array!(@jobs) do |job|
  json.extract! job, :id, :title, :addr, :city, :industry, :commission, :role, :requirement, :base_pay, :month, :bonus, :allowance, :stock, :stock_num, :concall_date, :user_id, :peer, :memo, :company_info, :work_year
  json.url job_url(job, format: :json)
end
