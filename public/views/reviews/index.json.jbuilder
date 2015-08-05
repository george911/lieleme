json.array!(@reviews) do |review|
  json.extract! review, :id, :author, :author_id, :top, :body, :rating, :user_id
  json.url review_url(review, format: :json)
end
