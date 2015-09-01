require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require 'active_record'

get("/") do
  @flight_prices = [].parse_flights
  erb(:index)
end
