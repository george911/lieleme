json.array!(@interviews) do |interview|
  if interview.datetime.present?
    json.extract! interview,:id
    json.start interview.datetime
    json.end interview.datetime
    json.url user_interview_path(interview, user_id:current_user.id,format: :html)
  end
end
