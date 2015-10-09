json.array!(@rsvps) do |rsvp|
  json.extract! rsvp, :id, :guest_id, :event_id, :pending, :confirmed
  json.url rsvp_url(rsvp, format: :json)
end
