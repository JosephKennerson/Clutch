json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :address_line_1, :address_line_2, :city, :state, :zip, :password, :photo, :first_name, :last_name
  json.url user_url(user, format: :json)
end
