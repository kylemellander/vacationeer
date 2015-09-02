class Input

  attr_accessor :budget, :city_name, :vacation_length

  def initialize(attributes)
    @budget = attributes[:budget].to_f
    @city_name = attributes[:city_name]
    @vacation_length = attributes[:vacation_length].to_i
  end

  def list_vacations
    vacations = []
    City.all().each do |city|
      city.city_data
      cost = city.daily_average_cost * vacation_length
      if cost <= budget
        vacations.push(city)
      end
    end
    vacations
  end

  # def possible_flights(origin, destination)
  #   raw_data = HTTParty.post("https://www.googleapis.com/qpxExpress/v1/trips/search?key=AIzaSyDqAnFxbvWwhyBZEGsZYN1lfGmIoOCE77k",
  #   :body => {
  #     request: {
  #       passengers: {adultCount: 1},
  #        slice: [{origin: "#{origin}", destination: "#{destination}", date: "2015-09-25"},{origin: "#{destination}", destination: "#{origin}", date: "2015-10-10"}]}}.to_json,
  #        slice: []
  #   :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'})
  #
  #   cheapest_costs = []
  #   cheapest_trips = []
  #   count = 0
  #   all_flights_data = raw_data.parsed_response.fetch("trips")
  #   all_flights_data.fetch("tripOption").each do |trip|
  #     if !cheapest_costs.include?(trip.fetch("saleTotal")) && count < 5
  #       cheapest_trips.push(trip)
  #       cheapest_costs.push(trip.fetch("saleTotal"))
  #       count += 1
  #     end
  #   end
  #
  #   cheapest_costs.each do |cost|
  #     puts "---------------------"
  #     puts "|ONE POSSIBLE FLIGHT|"
  #     puts "---------------------"
  #     puts "Flight Cost: " + cost
  #     puts "From " + cheapest_trips[0].fetch("slice")[0].fetch("segment")[0].fetch("leg")[0].fetch("origin") + " to " + cheapest_trips[0].fetch("slice")[0].fetch("segment")[0].fetch("leg")[0].fetch("destination")
  #     puts "Duration: " + cheapest_trips[0].fetch("slice")[0].fetch("segment")[0].fetch("duration").to_s + " minutes"
  #   end
  #
  # end

end
