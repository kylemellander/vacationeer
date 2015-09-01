class Airport < ActiveRecord::Base
  belongs_to(:cities)

  def airport_data
    @doc = Nokogiri::HTML(open("http://www.numbeo.com/hotel-prices/city_result.jsp?country=#{country_name.gsub(/ /, "+")}&city=#{city_name.gsub(/, /, "%2C+").gsub(/ /, "+")}&displayCurrency=USD"))
    self.update({daily_average_cost: daily_average_cost_calc, food_cost: food_price_calc, one_star_cost: hotel_prices[0], two_star_cost: hotel_prices[1], three_star_cost: hotel_prices[2], four_star_cost: hotel_prices[3], five_star_cost: hotel_prices[4]})
  end
end
