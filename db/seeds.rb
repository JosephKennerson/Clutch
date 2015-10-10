require 'FFaker'
require 'Faker'
100.times do
  random_size = rand(1..10)
  choose_approval = [true, false].sample
  Event.create!(
        public_location: FFaker::Venue.name,
        address_line_1: FFaker::Address.street_address,
        address_line_2: FFaker::Address.secondary_address,
        city: FFaker::Address.city,
        state: FFaker::Address.us_state_abbr,
        zip: FFaker::AddressUS.zip_code,
        max_size: random_size,
        time_start: Faker::Time.between(DateTime.now - 1, DateTime.now),
        time_end: Faker::Time.forward(1),
        name: FFaker::Company.catch_phrase,
        description: Faker::Hacker.say_something_smart,
        category: FFaker::Sport.name,
        approval_required: choose_approval,
    )

end
