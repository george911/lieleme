json.array!(@line_items) do |line_item|
  json.extract! line_item, :id, :mobile, :email, :name, :title, :status, :city, :talent_id, :user_id, :job_id
  json.url line_item_url(line_item, format: :json)
end
