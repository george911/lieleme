json.array!(@inquiries) do |inquiry|
  json.extract! inquiry, :id, :name, :employer, :title, :type, :mobile, :email, :content
  json.url inquiry_url(inquiry, format: :json)
end
