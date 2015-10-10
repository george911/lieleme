json.array!(@candidates) do |candidate|
  json.extract! candidate, :id, :name, :title, :employer, :mobile, :email, :city, :note, :profile, :user_id
  json.url candidate_url(candidate, format: :json)
end
