# random users

User.create(
        username: "Admin",
        address_line_1: "633 Folsom",
        address_line_2: "6th Floor",
        city: "San Francisco",
        state: "CA",
        zip: "94107",
        email: "admin@admin.com",
        password: "adminadmin",
        avatar: "https://pbs.twimg.com/profile_images/2370446440/6e2jwf7ztbr5t1yjq4c5.jpeg",
        first_name: "Admin",
        last_name: "Istrator",
        phone_number: "123-456-7890"
  )

User.create(
        username: "XanderPSON",
        address_line_1: "1400 26th Ave",
        address_line_2: "Apt 6",
        city: "San Francisco",
        state: "CA",
        zip: "94122",
        email: "xander@devbootcmap.com",
        password: "xanderpsonxanderpson",
        avatar: "https://pbs.twimg.com/profile_images/2370446440/6e2jwf7ztbr5t1yjq4c5.jpeg",
        first_name: "Xander",
        last_name: "Peterson",
        phone_number: "831-251-0146"
  )

User.create(
        username: "DarthJoie",
        address_line_1: "633 Folsom",
        address_line_2: "6th Floor",
        city: "San Francisco",
        state: "CA",
        zip: "94107",
        email: "jk@devbootcamp.com",
        password: "darthjoiedarthjoie",
        avatar: "https://pbs.twimg.com/profile_images/2370446440/6e2jwf7ztbr5t1yjq4c5.jpeg",
        first_name: "Joie",
        last_name: "Kennerson",
        phone_number: "123-456-7890"
  )

User.create(
        username: "Maddy",
        address_line_1: "633 Folsom",
        address_line_2: "6th Floor",
        city: "San Francisco",
        state: "CA",
        zip: "94107",
        email: "maddy@devootcamp.com",
        password: "maddymaddy",
        avatar: "https://pbs.twimg.com/profile_images/2370446440/6e2jwf7ztbr5t1yjq4c5.jpeg",
        first_name: "Madison",
        last_name: "Sites",
        phone_number: "123-456-7890"
  )

User.create(
        username: "CodingNutty",
        address_line_1: "633 Folsom",
        address_line_2: "6th Floor",
        city: "San Francisco",
        state: "CA",
        zip: "94107",
        email: "nruthya@devbootcamp.com",
        password: "codingnuttycodingnutty",
        avatar: "https://pbs.twimg.com/profile_images/2370446440/6e2jwf7ztbr5t1yjq4c5.jpeg",
        first_name: "Nruthya",
        last_name: "LongName",
        phone_number: "123-456-7890"
  )


Event.create(
        public_location: 'San Francisco',
        address_line_1: '275 Battery Street',
        address_line_2: '26th Floor',
        city: 'San Francisco',
        state: 'CA',
        zip: '94122',
        max_size: 4,
        time_start: DateTime.now - 1,
        time_end: DateTime.now,
        name: "Let's play basketball!",
        description: "Looking for 4 more people to play pickup basketball with me!",
        category: "Basketball",
        approval_required: false,
        host_id: 1,
        status: true,
        longitude: rand(-122.507367...-122.389335),
        latitude: rand(37.735722...37.807791)
    )

Event.create(
        public_location: 'San Francisco',
        address_line_1: '400 Battery Street',
        address_line_2: '8th Floor',
        city: 'San Francisco',
        state: 'CA',
        zip: '94122',
        max_size: 6,
        time_start: DateTime.now - 1,
        time_end: DateTime.now,
        name: "Let's play videogames!",
        description: "Looking for 4 more people to play Mario Kart with me!",
        category: "Videogames",
        approval_required: false,
        host_id: 2,
        status: true,
        longitude: rand(-122.507367...-122.389335),
        latitude: rand(37.735722...37.807791)
    )

Event.create(
        public_location: 'San Francisco',
        address_line_1: '500 Folsom Street',
        address_line_2: '6th Floor',
        city: 'San Francisco',
        state: 'CA',
        zip: '94122',
        max_size: 1,
        time_start: DateTime.now - 1,
        time_end: DateTime.now,
        name: "Netflix and Chill?",
        description: "Looking for one more to N&C with me",
        category: "Movie",
        approval_required: false,
        host_id: 3,
        status: true,
        longitude: rand(-122.507367...-122.389335),
        latitude: rand(37.735722...37.807791)
    )

10.times do
  User.create!(
        username: FFaker::Internet.user_name,
        address_line_1: FFaker::AddressUS.street_address,
        address_line_2: FFaker::AddressUS.secondary_address,
        city: FFaker::AddressUS.city,
        state: FFaker::AddressUS.state_abbr,
        zip: FFaker::AddressUS.zip_code,
        email: FFaker::Internet.disposable_email,
        password: FFaker::Internet.password,
        avatar: Faker::Avatar.image,
        first_name: FFaker::Name.first_name,
        last_name: Faker::Name.last_name,
        phone_number: Faker::PhoneNumber.phone_number.to_i
    )

end

# Admin events

5.times do
  random_size = rand(1..10)
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
        description: FFaker::HipsterIpsum.phrase,
        category: FFaker::Sport.name,
        approval_required: FFaker::Boolean.sample,
        host_id: 1,
        status: FFaker::Boolean.sample,
        longitude: rand(-122.507367...-122.389335),
        latitude: rand(37.735722...37.807791)
    )

end

# random events

30.times do
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
        status: FFaker::Boolean.sample,
        longitude: rand(-122.507367...-122.389335),
        latitude: rand(37.735722...37.807791)
    )

end

# Admin comments

10.times do
  random_event = rand(1..Event.count)
  Comment.create!(
        event_id: random_event,
        user_id: 1,
        body: FFaker::BaconIpsum.phrase,
        is_private: FFaker::Boolean.sample
    )

end

# random comments (public and private)

50.times do
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
  random_event = rand(1..Event.count)
  new_event = Rsvp.create!(
      guest_id: random_guest,
      event_id: random_event,
      message: Faker::Hacker.say_something_smart,
      pending: true
    )

end

#Admin pending rsvps

10.times do
  random_event = rand(1..Event.count)
  new_event = Rsvp.create!(
      guest_id: 1,
      event_id: random_event,
      message: Faker::Hacker.say_something_smart,
      pending: true
    )

end

# Admin (not pending) rsvps

10.times do
  random_guest = rand(10..User.count)
  random_event = rand(1..Event.count)
  new_event = Rsvp.create!(
      guest_id: random_guest,
      event_id: random_event,
      message: Faker::Hacker.say_something_smart,
      pending: false,
      confirmed: FFaker::Boolean.sample
    )

end

# random not-pending rsvps (true and false; id #26-50)

30.times do

  random_guest = rand(10..User.count)
  random_host = rand(1..9)
  random_event = rand(1..Event.count)
  new_event = Rsvp.create!(
      guest_id: random_guest,
      event_id: random_event,
      pending: false,
      message: Faker::Hacker.say_something_smart,
      confirmed: FFaker::Boolean.sample
    )

end

# random confirmed rsvps (id #51-75)

30.times do

  random_guest = rand(10..User.count)
  random_host = rand(1..9)
  random_event = rand(1..Event.count)
  new_event = Rsvp.create!(
      guest_id: random_guest,
      event_id: random_event,
      pending: false,
      message: Faker::Hacker.say_something_smart,
      confirmed: true
    )

end

# random ratings (from confirmed rsvps)
25.times do
  count = 1
  current_event = Event.find(count)
  random_guest = current_event.guests.sample
      Rating.create!(
          event_id: count,
          rating: rand(1.0..5.0),
          rating_feedback: FFaker::HipsterIpsum.phrase,
          rater_id: current_event.host.id,
          ratee_id: random_guest.id
        )
    count += 1
end

# random ratings (switched roles)

25.times do
  count = 1
  current_event = Event.find(count)
      Rating.create!(
          event_id: count,
          rating: rand(1.0..5.0),
          rating_feedback: FFaker::HipsterIpsum.phrase,
          ratee_id: current_event.host.id,
          rater_id: current_event.guests.sample.id
        )
    count += 1
end



