json.array!(@events) do |event|
  json.extract! event, :id, :public_location, :address_line_1, :address_line_2, :city, :state, :zip, :max_size, :user_id, :time_start, :time_end, :name, :description, :category, :status, :approval_required
  json.url event_url(event, format: :json)
end
