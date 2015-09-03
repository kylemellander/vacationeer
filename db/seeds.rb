require("bundler/setup")
Bundler.require(:default)

Dir[File.expand_path('../.') + '/vacationeer/lib/*.rb'].each { |file| require file }

activity1 = Activity.create({name: "Night Life", group: "Social"})
activity2 = Activity.create({name: "Hiking", group: "Outdoors"})
activity3 = Activity.create({name: "Beach", group: "Location"})
activity4 = Activity.create({name: "Urban", group: "Location"})
activity5 = Activity.create({name: "Historical Landmarks", group: "Tourist"})
activity6 = Activity.create({name: "Museums", group: "Arts"})
activity7 = Activity.create({name: "Beach", group: "Location"})
activity8 = Activity.create({name: "Local Culture", group: "Social"})
activity1 = Activity.create({name: "Family Friendly", group: "Life"})
activity2 = Activity.create({name: "Romantic", group: "Life"})
activity3 = Activity.create({name: "Peace and Quiet", group: "Life"})
activity4 = Activity.create({name: "Mountains", group: "Location"})
activity5 = Activity.create({name: "Island", group: "Location"})
activity6 = Activity.create({name: "Theater/Musicals", group: "Arts"})
activity7 = Activity.create({name: "Concerts", group: "Arts"})
activity8 = Activity.create({name: "Golf", group: "Outdoors"})



city = City.create({:city_name => 'Seattle, WA', :country_name => 'United States'})
Airport.create({:airport_code => "SEA", :city_id => city.id})

city = City.create({:city_name => 'Tokyo', :country_name => 'Japan'})
Airport.create({:airport_code => "NRT", :city_id => city.id})

city = City.create({:city_name => 'Las Vegas, NV', :country_name => 'United States'})
Airport.create({:airport_code => "LAS", :city_id => city.id})

city = City.create({:city_name => 'Berlin', :country_name => 'Germany', img: "http://media-1.web.britannica.com/eb-media/01/20101-004-4D6DDC93.jpg"})
Airport.create({:airport_code => "SXF", :city_id => city.id})

city = City.create({:city_name => 'Paris', :country_name => 'France'})
Airport.create({:airport_code => "LBG", :city_id => city.id})

city = City.create({:city_name => 'Madrid', :country_name => 'Spain'})
Airport.create({:airport_code => "MAD", :city_id => city.id})

city = City.create({:city_name => 'Philadelphia, PA', :country_name => 'United States'})
Airport.create({:airport_code => "PHL", :city_id => city.id})

city = City.create({:city_name => 'New York, NY', :country_name => 'United States'})
Airport.create({:airport_code => "JFK", :city_id => city.id})

city = City.create({:city_name => 'Victoria', :country_name => 'Canada'})
Airport.create({:airport_code => "YYJ", :city_id => city.id})

city = City.create({:city_name => 'Houston, TX', :country_name => 'United States'})
Airport.create({:airport_code => "JFK", :city_id => city.id})

city = City.create({:city_name => 'San Francisco, CA', :country_name => 'United States'})
Airport.create({:airport_code => "SFO", :city_id => city.id})

city = City.create({:city_name => 'Miami, FL', :country_name => 'United States'})
Airport.create({:airport_code => "MIA", :city_id => city.id})

city = City.create({:city_name => 'Kingston', :country_name => 'Jamaica'})
Airport.create({:airport_code => "KIN", :city_id => city.id})
