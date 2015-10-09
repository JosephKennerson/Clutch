json.array!(@comments) do |comment|
  json.extract! comment, :id, :event_id, :user_id, :is_private, :body
  json.url comment_url(comment, format: :json)
end
