json.array!(@ratings) do |rating|
  json.extract! rating, :id, :event_id, :rating, :rating_feedback, :rater_id, :ratee_id
  json.url rating_url(rating, format: :json)
end
