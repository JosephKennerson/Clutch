
200.times do
  User.create!(
        username: FFaker::Internet.user_name,
        address_line_1: FFaker::AddressUS.street_address,
        address_line_2: FFaker::AddressUS.secondary_address,
        city: FFaker::AddressUS.city,
        state: FFaker::AddressUS.state_abbr,
        zip: FFaker::AddressUS.zip_code,
        email: FFaker::Internet.disposable_email,
        password: FFaker::Internet.password,
        photo: Faker::Avatar.image,
        first_name: FFaker::Name.first_name,
        last_name: Faker::Name.last_name
    )

end

100.times do
  random_size = rand(1..10)
  random_user = User.find(rand(1..User.count))
  Event.create!(
        public_location: FFaker::Venue.name,
        address_line_1: FFaker::AddressUS.street_address,
        address_line_2: FFaker::AddressUS.secondary_address,
        city: FFaker::AddressUS.city,
        state: FFaker::AddressUS.state_abbr,
        zip: FFaker::AddressUS.zip_code,
        max_size: random_size,
        time_start: Faker::Time.between(DateTime.now - 1, DateTime.now),
        time_end: Faker::Time.forward(1),
        name: FFaker::Company.catch_phrase,
        description: Faker::Hacker.say_something_smart,
        category: FFaker::Sport.name,
        approval_required: FFaker::Boolean.sample,
        host_id: random_user
    )

end
