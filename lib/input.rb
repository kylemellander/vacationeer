require 'lotus/validations'

class Input
  include Lotus::Validations

  validates :budget, presence: true
  validates :city_name, presence: true
  validates :vacation_length, presence: true
  validates :airport_code, presence: true
  validates :activity_ids, presence: true
  attr_accessor :budget, :city_name, :vacation_length, :airport_code, :activity_ids

  def initialize(attributes)
    @budget = attributes[:budget].to_f
    @city_name = attributes[:city_name]
    @airport_code = attributes[:airport_code]
    @vacation_length = attributes[:vacation_length].to_i
    @activity_ids = attributes[:activity_ids]
  end

  def list_vacations
    vacations = []
    City.all().order('daily_average_cost asc').each do |city|
      count = 0
      if @activity_ids != nil
        @activity_ids.each do |activity_id|
          activity = city.activities.where(id: activity_id.to_i)
          if activity != []
            count += 1
          end
        end
      end
      fetch_flight_cost
      city.city_data
      cost = (city.daily_average_cost * vacation_length) + (city.origins.first.cost * 2)
      if cost <= budget
        vacations.push({count: count, city: city})
      end
    end
    vacations.sort_by! { |hsh| hsh[:count] }
    result = []
    vacations.each { |vacation| result.push(vacation.values.last) }
    result.reverse
  end

  def fetch_flight_cost
    total_flight_cost = 0
    City.all.each do |city|
      origin = Origin.where(city_id: city.id).find_by(name: airport_code)
      if origin == nil
        href = "http://www.faredetective.com/farehistory/flights-from-#{city_name_only.first.gsub(/ /, "_")}-#{airport_code}-to-#{city.city_name.split(",").first.gsub(/ /, "_")}-#{city.airports.first.airport_code}.html"
        doc = Nokogiri::HTML(open(href))
        doc.css('.div7').each do |flight_info|
          total_flight_cost = flight_info.text.split("Average price: ")[1].split("Cheapest months to travel: ")[0].to_i
        end
        Origin.create({name: airport_code, :cost => total_flight_cost, :city_id => city.id})
      elsif origin.updated_at < (Time.now - 1.day)
        doc = Nokogiri::HTML(open("http://www.faredetective.com/farehistory/flights-from-#{city_name_only}-#{airport_code}-to-#{city.city_name.split(",").first}-#{city.airports.first.airport_code}.html"))
        doc.css('.div7').each do |flight_info|
          total_flight_cost = flight_info.text.split("Average price: ")[1].split("Cheapest months to travel: ")[0].to_i
        end
        origin.update({cost: total_flight_cost})
      end
    end
  end

  def city_name_only
    city_name.split(",").first
  end

end
