# random users

User.create!(
        username: admin,
        address_line_1: "633 Folsom",
        address_line_2: "6th Floor",
        city: "San Francisco",
        state: "CA",
        zip: 94107,
        email: admin@admin.com,
        password: adminadmin,
        photo: "https://pbs.twimg.com/profile_images/2370446440/6e2jwf7ztbr5t1yjq4c5.jpeg",
        first_name: "Admin",
        last_name: "Istrator"
  )

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

# random events

100.times do
  random_size = rand(1..10)
  random_user = rand(1..User.count)
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
        host_id: random_user,
        status: FFaker::Boolean.sample
    )

end

# random comments (public and private)

200.times do
  random_event = rand(1..Event.count)
  random_user = rand(1..User.count)
  Comment.create!(
        event_id: random_event,
        user_id: random_user,
        body: FFaker::BaconIpsum.phrase,
        is_private: FFaker::Boolean.sample
    )

end

# random pending rsvps (id # 1-25)

25.times do
  random_guest = rand(10..User.count)
  random_host = rand(1..9)
  random_event = rand(1..Event.count)
  new_event = Rsvp.create!(
      guest_id: random_guest,
      event_id: random_event,
      pending: true,
    )

end

# random not-pending rsvps (true and false; id #26-50)

25.times do

  random_guest = rand(10..User.count)
  random_host = rand(1..9)
  random_event = rand(1..Event.count)
  new_event = Rsvp.create!(
      guest_id: random_guest,
      event_id: random_event,
      pending: false,
      confirmed: FFaker::Boolean.sample
    )

end

# random confirmed rsvps (id #51-75)

25.times do

  random_guest = rand(10..User.count)
  random_host = rand(1..9)
  random_event = rand(1..Event.count)
  new_event = Rsvp.create!(
      guest_id: random_guest,
      event_id: random_event,
      pending: false,
      confirmed: true
    )

end

# random ratings (from confirmed rsvps)

# Events.each do |event|
#   event_id = event.id

#   Rating.create! (
#       event_id: event_id,
#       rating: rand(1.0..5.0),
#       rating_feedback: FFaker.HipsterIpsum.phrase,
#       rater_id: event.host.id
#       ratee_id: event.guests.sample.id
#     )


# end

# Events.each do |event|

#   Rating.create! (
#       event_id: event.id,
#       rating: rand(1.0..5.0),
#       rating_feedback: FFaker.HipsterIpsum.phrase,
#       ratee_id: event.host.id
#       rater_id: event.guests.sample.id
#     )


# end



