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



city = City.create({:city_name => 'Seattle, WA', :country_name => 'United States', img: "http://media-cdn.tripadvisor.com/media/photo-s/03/9b/30/26/seattle.jpg"})
Airport.create({:airport_code => "SEA", :city_id => city.id})

city = City.create({:city_name => 'Tokyo', :country_name => 'Japan', img: "http://www.maryville.edu/globaled/files/2012/09/file3041299869591.png"})
Airport.create({:airport_code => "NRT", :city_id => city.id})

city = City.create({:city_name => 'Las Vegas, NV', :country_name => 'United States', img: "http://allworldtowns.com/data_images/countries/las-vegas/las-vegas-08.jpg"})
Airport.create({:airport_code => "LAS", :city_id => city.id})

city = City.create({:city_name => 'Berlin', :country_name => 'Germany', img: "http://media-1.web.britannica.com/eb-media/01/20101-004-4D6DDC93.jpg"})
Airport.create({:airport_code => "TXL", :city_id => city.id})

city = City.create({:city_name => 'Paris', :country_name => 'France', img: "http://www.telegraph.co.uk/travel/destination/article130148.ece/ALTERNATES/w620/parisguidetower.jpg"})
Airport.create({:airport_code => "ORY", :city_id => city.id})

city = City.create({:city_name => 'Madrid', :country_name => 'Spain', img: "http://www.graciemag.com/en/wp-content/uploads/2014/08/Aerial-view-of-Gran-Via-shopping-street-in-Madrid-Spain.jpg"})
Airport.create({:airport_code => "MAD", :city_id => city.id})

city = City.create({:city_name => 'Philadelphia, PA', :country_name => 'United States', img: "https://geoguessr.com/images/dd05effb76800125147b1b4b86956f0c.jpg"})
Airport.create({:airport_code => "PHL", :city_id => city.id})

city = City.create({:city_name => 'New York, NY', :country_name => 'United States', img: "http://mikegillermancomedy.com/wp-content/uploads/2014/09/newyork_2705424b.jpg"})
Airport.create({:airport_code => "JFK", :city_id => city.id})

city = City.create({:city_name => 'Victoria', :country_name => 'Canada', img: "http://i.telegraph.co.uk/multimedia/archive/02218/vancouver1_2218962b.jpg"})
Airport.create({:airport_code => "YYJ", :city_id => city.id})

city = City.create({:city_name => 'Houston, TX', :country_name => 'United States', img: "http://static1.squarespace.com/static/54a1bb27e4b07419f3973e5e/54e6490fe4b0f93fe9fe9e53/54e7aa57e4b07c01c5b707d8/1424802371628/?format=1500w"})
Airport.create({:airport_code => "JFK", :city_id => city.id})

city = City.create({:city_name => 'San Francisco, CA', :country_name => 'United States', img: "http://images.contentful.com/niwziy2l9cvz/1XBkFZIKqYw0248uGCuaWG/cc3d1c8fec71b6706ac961b449d2d823/san-francisco-san-francisco-bay-1112x630.jpg"})
Airport.create({:airport_code => "SFO", :city_id => city.id})

city = City.create({:city_name => 'Miami, FL', :country_name => 'United States', img: "http://www.smartdestinations.com/blog/wp-content/uploads/2012/07/miami.jpg"})
Airport.create({:airport_code => "MIA", :city_id => city.id})

city = City.create({:city_name => 'Kingston', :country_name => 'Jamaica', img: "https://upload.wikimedia.org/wikipedia/commons/e/ef/Kingston,_Jamaica.jpg"})
Airport.create({:airport_code => "KIN", :city_id => city.id})
