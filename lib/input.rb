class Input

  attr_accessor :budget, :city_name, :vacation_length, :airport_code

  def initialize(attributes)
    @budget = attributes[:budget].to_f
    @city_name = attributes[:city_name]
    @airport_code = attributes[:airport_code]
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

  def city_name_only
    city_name.split(",").first
  end

end
