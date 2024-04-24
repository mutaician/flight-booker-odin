# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Flight.delete_all
Airport.delete_all

# Create airports
airport_codes = ['JFK', 'LAX', 'ORD', 'DFW', 'ATL', 'SFO', 'SEA', 'MIA', 'BOS', 'PHL'].shuffle
airports = airport_codes.map do |code|
  Airport.find_or_create_by(code: code)
end

# Create flights
airports.each do |departure_airport|
  (airports - [departure_airport]).each do |arrival_airport|
    rand(1..5).times do
      start_datetime = Faker::Time.forward(days: 23, period: :day)
      flight_duration = rand(1.5..10.0).round(2)
      Flight.create!(departure_airport: departure_airport, arrival_airport: arrival_airport, start_datetime: start_datetime, flight_duration: flight_duration)
    end
  end
end
