require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require 'active_record'

get "/"  do
  erb(:index)
end

get "/hotels" do
  @hotel_prices = [].parse_hotel_prices
  erb(:hotels)
end
