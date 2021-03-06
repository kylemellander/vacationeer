require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb(:index)
end

get '/vacations' do
  @budget = params['budget'].to_f
  @city_name = params['city_name']
  @airport_code = params["airport_code"]
  @vacation_length = params['vacation_length'].to_i
  @activity_ids = params["activity_ids"]
  @input = Input.new({budget: @budget, city_name: @city_name, vacation_length: @vacation_length, airport_code: @airport_code, activity_ids: @activity_ids})
  if @input.valid? && @budget != 0 && @activity_ids != nil
    @cities = @input.list_vacations
    erb(:vacations)
  else
    erb(:index)
  end
end

get '/admins' do
  @cities = City.all().order(:city_name)
  @activities = Activity.all.order(:group)
  erb(:admin)
end

post '/admins/new_city' do
  city_name = params["city_name"]
  country_name = params["country_name"]
  airport_code = params['airport_code'].upcase
  city = City.create({city_name: city_name, country_name: country_name})
  Airport.create({airport_code: airport_code, city_id: city.id})
  city.fetch
  redirect '/admins'
end

post '/admins/new_activity' do
  name = params["name"]
  group = params["group"]
  Activity.create({name: name, group: group})
  redirect '/admins'
end

patch '/cities/:id' do
  id = params['id'].to_i
  city_name = params['city_name']
  country = params['country_name']
  airport_code = params['airport_code'].upcase
  activity_ids = params['activity_ids']
  img = params['img']
  activity_inputs = []
  activity_ids.each {|id| activity_inputs.push(id.to_i)} if activity_ids != nil
  city = City.find(id)
  city.update({city_name: city_name, country_name: country, activity_ids: activity_inputs, img: img})
  city.airports.first.update({airport_code: airport_code})
  redirect '/admins'
end

patch '/activities/:id' do
  id = params["id"].to_i
  name = params["name"]
  group = params["group"]
  Activity.find(id).update({name: name, group: group})
  redirect '/admins'
end
