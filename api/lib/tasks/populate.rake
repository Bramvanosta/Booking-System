# lib/tasks/populate.rake
#
# Rake task to populate development database with test data
# Run it with "rails db:populate"

namespace :db do
  desc 'Erase and fill database'
  task populate: :environment do
    require 'faker'

    # Reset the database
    Rake::Task['db:kill_postgres_connections'].invoke
    Rake::Task['db:reset'].invoke

    # Create an user
    user = User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: 'user@test.fr',
        password: 'password'
    )

    # Create an admin
    admin = User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: 'admin@test.fr',
        password: 'password'
    )

    puts 'Users created'

    # Create a campground
    campground = Campground.create!(
        name: Faker::Company.name,
        address: Faker::Address.street_address,
        zip_code: Faker::Address.zip_code,
        city: Faker::Address.city,
        country: Faker::Address.country,
        longitude: Faker::Address.longitude,
        latitude: Faker::Address.latitude,
        website_url: Faker::Internet.url,
        phone_number: Faker::PhoneNumber.phone_number,
        mobile_number: Faker::PhoneNumber.cell_phone,
        currency: 'EUR'
    )

    puts 'Campground created'

    ApiKey.create!(
        user_id: user.id,
        campground_id: campground.id,
        name: 'Test User API Key 1',
        can_view_bookings: true,
        can_edit_bookings: false
    )

    ApiKey.create!(
        user_id: admin.id,
        campground_id: campground.id,
        name: 'Test Admin API Key 1',
        can_view_bookings: true,
        can_edit_bookings: true
    )

    puts 'API Keys created'

    # Set viewing rights to user
    Right.create!(
        user_id: user.id,
        campground_id: campground.id,
        can_view_bookings: true,
        can_edit_bookings: false
    )

    # Set viewing and edit rights to admin
    Right.create!(
        user_id: admin.id,
        campground_id: campground.id,
        can_view_bookings: true,
        can_edit_bookings: true
    )

    puts 'Rights created'

    # Create 3 seasons
    low_season = Season.create!(
        campground_id: campground.id,
        name: 'Low season',
        start_date: Date.new(2017, 4, 1),
        end_date: Date.new(2017, 7, 1)
    )

    high_season = Season.create!(
        campground_id: campground.id,
        name: 'High season',
        start_date: Date.new(2017, 7, 2),
        end_date: Date.new(2017, 9, 1)
    )

    puts 'Seasons created'

    # Create 3 rental categories
    pitch = RentalCategory.create!(
        campground_id: campground.id,
        name: 'Pitch'
    )

    mobilhome = RentalCategory.create!(
        campground_id: campground.id,
        name: 'Mobilehome'
    )

    refrigerator = RentalCategory.create!(
        campground_id: campground.id,
        name: 'Refrigerator'
    )

    puts 'Rental Categories created'

    # Create prices for each rental category for each season
    Price.create!(
        season_id: low_season.id,
        rental_category_id: pitch.id,
        name: 'Pitch',
        price_cents: 675,
        price_currency: campground.currency
    )

    Price.create!(
        season_id: low_season.id,
        rental_category_id: pitch.id,
        name: 'Adult',
        price_cents: 575,
        price_currency: campground.currency
    )

    Price.create!(
        season_id: low_season.id,
        rental_category_id: pitch.id,
        name: 'Child',
        price_cents: 325,
        price_currency: campground.currency
    )

    Price.create!(
        season_id: low_season.id,
        rental_category_id: pitch.id,
        name: 'Electricity',
        price_cents: 550,
        price_currency: campground.currency
    )

    Price.create!(
        season_id: low_season.id,
        rental_category_id: mobilhome.id,
        name: 'Per night',
        price_cents: 6000,
        price_currency: campground.currency
    )

    Price.create!(
        season_id: low_season.id,
        rental_category_id: refrigerator.id,
        name: 'Per night',
        price_cents: 475,
        price_currency: campground.currency
    )

    Price.create!(
        season_id: high_season.id,
        rental_category_id: pitch.id,
        name: 'Pitch',
        price_cents: 1275,
        price_currency: campground.currency
    )

    Price.create!(
        season_id: high_season.id,
        rental_category_id: pitch.id,
        name: 'Adult',
        price_cents: 800,
        price_currency: campground.currency
    )

    Price.create!(
        season_id: high_season.id,
        rental_category_id: pitch.id,
        name: 'Child',
        price_cents: 500,
        price_currency: campground.currency
    )

    Price.create!(
        season_id: high_season.id,
        rental_category_id: pitch.id,
        name: 'Electricity',
        price_cents: 550,
        price_currency: campground.currency
    )

    Price.create!(
        season_id: high_season.id,
        rental_category_id: mobilhome.id,
        name: 'Per week',
        price_cents: 82500,
        price_currency: campground.currency
    )

    Price.create!(
        season_id: high_season.id,
        rental_category_id: refrigerator.id,
        name: 'Per night',
        price_cents: 475,
        price_currency: campground.currency
    )

    puts 'Prices created'

    # Create 100 Pitches
    100.times do |n|
      Rental.create!(
          rental_category_id: pitch.id,
          name: "Pitch-#{n}"
      )
    end

    # Create 5 Mobilhomes
    5.times do |n|
      Rental.create!(
          rental_category_id: mobilhome.id,
          name: "Mobilhome-#{n}"
      )
    end

    # Create 25 Refrigerator
    5.times do |n|
      Rental.create!(
          rental_category_id: refrigerator.id,
          name: "Refrigerator-#{n}"
      )
    end

    puts 'Rentals created'

    # Create 25 Clients with one pitch booking each in low season
    25.times do |n|
      client = Client.create!(
          title: Faker::Name.prefix,
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          email: Faker::Internet.safe_email,
          address: Faker::Address.street_address,
          zip_code: Faker::Address.zip_code,
          city: Faker::Address.city,
          country: Faker::Address.country,
          phone_number: Faker::PhoneNumber.phone_number
      )

      booking = Booking.create!(
          campground_id: campground.id,
          client_id: client.id,
          arrival_date: Faker::Date.between(Date.new(2018, 4, 1), Date.new(2018, 6, 1)),
          departure_date: Faker::Date.between(Date.new(2018, 6, 2), Date.new(2018, 7, 1))
      )

      rand(2...4).times do
        person = Person.create!(
            client_id: client.id,
            birth_date: Faker::Date.between(40.years.ago, 2.years.ago)
        )

        BookingHasPerson.create!(
            booking_id: booking.id,
            person_id: person.id
        )
      end

      BookingHasRental.create!(
          booking_id: booking.id,
          rental_id: Rental.where(rental_category_id: pitch.id).order('RANDOM()').first.id
      )

      if n % 3 === 0
        BookingHasRental.create!(
            booking_id: booking.id,
            rental_id: Rental.where(rental_category_id: refrigerator.id).order('RANDOM()').first.id
        )
      end

      puts 'Client with Booking created'
    end

    # Create 10 Clients with one mobilehome booking each in low season
    10.times do
      client = Client.create!(
          title: Faker::Name.prefix,
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          email: Faker::Internet.safe_email,
          address: Faker::Address.street_address,
          zip_code: Faker::Address.zip_code,
          city: Faker::Address.city,
          country: Faker::Address.country,
          phone_number: Faker::PhoneNumber.phone_number
      )

      booking = Booking.create!(
          campground_id: campground.id,
          client_id: client.id,
          arrival_date: Faker::Date.between(Date.new(2018, 4, 1), Date.new(2018, 6, 1)),
          departure_date: Faker::Date.between(Date.new(2018, 6, 2), Date.new(2018, 7, 1))
      )

      rand(2...4).times do
        person = Person.create!(
            client_id: client.id,
            birth_date: Faker::Date.between(40.years.ago, 2.years.ago)
        )

        BookingHasPerson.create!(
            booking_id: booking.id,
            person_id: person.id
        )
      end

      BookingHasRental.create!(
          booking_id: booking.id,
          rental_id: Rental.where(rental_category_id: mobilhome.id).order('RANDOM()').first.id
      )

      puts 'Client with Booking created'
    end

    # Create 25 Clients with one pitch booking each in high season
    25.times do |n|
      client = Client.create!(
          title: Faker::Name.prefix,
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          email: Faker::Internet.safe_email,
          address: Faker::Address.street_address,
          zip_code: Faker::Address.zip_code,
          city: Faker::Address.city,
          country: Faker::Address.country,
          phone_number: Faker::PhoneNumber.phone_number
      )

      booking = Booking.create!(
          campground_id: campground.id,
          client_id: client.id,
          arrival_date: Faker::Date.between(Date.new(2018, 7, 2), Date.new(2018, 8, 1)),
          departure_date: Faker::Date.between(Date.new(2018, 8, 2), Date.new(2018, 9, 1))
      )

      rand(2...6).times do
        person = Person.create!(
            client_id: client.id,
            birth_date: Faker::Date.between(40.years.ago, 2.years.ago)
        )

        BookingHasPerson.create!(
            booking_id: booking.id,
            person_id: person.id
        )
      end

      BookingHasRental.create!(
          booking_id: booking.id,
          rental_id: Rental.where(rental_category_id: pitch.id).order('RANDOM()').first.id
      )

      if n % 3 === 0
        BookingHasRental.create!(
            booking_id: booking.id,
            rental_id: Rental.where(rental_category_id: refrigerator.id).order('RANDOM()').first.id
        )
      end

      puts 'Client with Booking created'
    end

    # Create 10 Clients with one mobilehome booking each in high season
    10.times do
      client = Client.create!(
          title: Faker::Name.prefix,
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          email: Faker::Internet.safe_email,
          address: Faker::Address.street_address,
          zip_code: Faker::Address.zip_code,
          city: Faker::Address.city,
          country: Faker::Address.country,
          phone_number: Faker::PhoneNumber.phone_number
      )

      booking = Booking.create!(
          campground_id: campground.id,
          client_id: client.id,
          arrival_date: Faker::Date.between(Date.new(2018, 7, 2), Date.new(2018, 8, 1)),
          departure_date: Faker::Date.between(Date.new(2018, 8, 2), Date.new(2018, 9, 1))
      )

      rand(2...6).times do
        person = Person.create!(
            client_id: client.id,
            birth_date: Faker::Date.between(40.years.ago, 2.years.ago)
        )

        BookingHasPerson.create!(
            booking_id: booking.id,
            person_id: person.id
        )
      end

      BookingHasRental.create!(
          booking_id: booking.id,
          rental_id: Rental.where(rental_category_id: mobilhome.id).order('RANDOM()').first.id
      )

      puts 'Client with Booking created'
    end
  end
end