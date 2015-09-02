require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb(:index)
end

post '/' do
  budget = params['budget'].to_f
  city_name = params['city_name']
  vacation_length = params['vacation_length']
  input = Input.new({budget: budget, city_name: city_name, vacation_length: vacation_length})
  @cities = input.list_vacations
  erb(:vacations)
end

get '/admins' do
  @cities = City.all()
  @activities = Activity.all()
  erb(:admin)
end

post '/admins/new_city' do
  city_name = params["city_name"]
  country_name = params["country_name"]
  City.create({city_name: city_name, country_name: country_name})
  redirect '/admins'
end

post '/admins/new_activity' do
  name = params["name"]
  group = params["group"]
  Activity.create({name: name, group: group})
  redirect '/admins'
end
