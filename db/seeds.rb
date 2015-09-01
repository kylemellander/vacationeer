require("bundler/setup")
Bundler.require(:default)

lame = Dir[File.expand_path('../.') + '/vacationeer/lib/*.rb'].each { |file| require file }


City.create({:city_name => 'Seattle, WA', :country_name => 'United States', :transportation_cost => 0.0, :food_cost => 0.0, :accomodation_cost => 0.0, :last_updated => Time.new(2000)})
City.create({:city_name => 'Tokyo', :country_name => 'Japan', :transportation_cost => 0.0, :food_cost => 0.0, :accomodation_cost => 0.0, :last_updated => Time.new(2000)})
City.create({:city_name => 'Las Vegas, NV', :country_name => 'United States', :transportation_cost => 0.0, :food_cost => 0.0, :accomodation_cost => 0.0, :last_updated => Time.new(2000)})
City.create({:city_name => 'Berlin', :country_name => 'Germany', :transportation_cost => 0.0, :food_cost => 0.0, :accomodation_cost => 0.0, :last_updated => Time.new(2000)})
City.create({:city_name => 'Paris', :country_name => 'France', :transportation_cost => 0.0, :food_cost => 0.0, :accomodation_cost => 0.0, :last_updated => Time.new(2000)})
City.create({:city_name => 'Madrid', :country_name => 'Spain', :transportation_cost => 0.0, :food_cost => 0.0, :accomodation_cost => 0.0, :last_updated => Time.new(2000)})
City.create({:city_name => 'Philadelphia, PA', :country_name => 'United States', :transportation_cost => 0.0, :food_cost => 0.0, :accomodation_cost => 0.0, :last_updated => Time.new(2000)})
City.create({:city_name => 'New York, NY', :country_name => 'United States', :transportation_cost => 0.0, :food_cost => 0.0, :accomodation_cost => 0.0, :last_updated => Time.new(2000)})
City.create({:city_name => 'Victoria', :country_name => 'Canada', :transportation_cost => 0.0, :food_cost => 0.0, :accomodation_cost => 0.0, :last_updated => Time.new(2000)})
City.create({:city_name => 'Houston, TX', :country_name => 'United States', :transportation_cost => 0.0, :food_cost => 0.0, :accomodation_cost => 0.0, :last_updated => Time.new(2000)})
City.create({:city_name => 'San Francisco, CA', :country_name => 'United States', :transportation_cost => 0.0, :food_cost => 0.0, :accomodation_cost => 0.0, :last_updated => Time.new(2000)})
City.create({:city_name => 'Seattle, WA', :country_name => 'United States', :transportation_cost => 0.0, :food_cost => 0.0, :accomodation_cost => 0.0, :last_updated => Time.new(2000)})
City.create({:city_name => 'Kingston', :country_name => 'Jamaica', :transportation_cost => 0.0, :food_cost => 0.0, :accomodation_cost => 0.0, :last_updated => Time.new(2000)})
