# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Airport.find_or_create_by(code: 'JFK')
Airport.find_or_create_by(code: 'LAX')
Airport.find_or_create_by(code: 'ORD')
Airport.find_or_create_by(code: 'DFW')
Airport.find_or_create_by(code: 'ATL')

Flight.find_or_create_by(departure_airport: Airport.find_by(code: 'JFK'), arrival_airport: Airport.find_by(code: 'LAX'), start_datetime: '2024-04-15 19:30:34', flight_duration: 6.5)
Flight.find_or_create_by(departure_airport: Airport.find_by(code: 'LAX'), arrival_airport: Airport.find_by(code: 'JFK'), start_datetime: '2024-04-26 19:30:34', flight_duration: 6.5)
Flight.find_or_create_by(departure_airport: Airport.find_by(code: 'ORD'), arrival_airport: Airport.find_by(code: 'DFW'), start_datetime: '2024-04-10 19:30:34', flight_duration: 2.5)
Flight.find_or_create_by(departure_airport: Airport.find_by(code: 'DFW'), arrival_airport: Airport.find_by(code: 'ORD'), start_datetime: '2024-04-27 19:30:34', flight_duration: 5.5)
Flight.find_or_create_by(departure_airport: Airport.find_by(code: 'ATL'), arrival_airport: Airport.find_by(code: 'JFK'), start_datetime: '2024-04-04 19:30:34', flight_duration: 7.5)
Flight.find_or_create_by(departure_airport: Airport.find_by(code: 'JFK'), arrival_airport: Airport.find_by(code: 'ATL'), start_datetime: '2024-04-22 19:30:34', flight_duration: 4.5)
Flight.find_or_create_by(departure_airport: Airport.find_by(code: 'DFW'), arrival_airport: Airport.find_by(code: 'ORD'), start_datetime: '2024-04-27 12:30:34', flight_duration: 5.5)
