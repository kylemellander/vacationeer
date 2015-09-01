require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require 'active_record'

get "/"  do
  erb(:index)
end

get "/hotels" do
  @hotel_prices = ["New York, NY", "United States"].parse_hotel_prices
  @tourist_average_cost = ["New York, NY", "United States"].tourist_average_cost
  erb(:hotels)
end
