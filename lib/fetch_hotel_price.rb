require 'nokogiri'
require 'open-uri'

class Array

  def city_data
    doc = Nokogiri::HTML(open("http://www.numbeo.com/hotel-prices/city_result.jsp?country=#{self[1].gsub(/ /, "+")}&city=#{self[0].gsub(/, /, "%2C+").gsub(/ /, "+")}&displayCurrency=USD"))
    city = City.find_by(:city_name, self[0])
    city.update({daily_average_cost: daily_average_cost})
    accomodation = Accomodation.find_by(:city_id, city.id)
    accomodation.update({one_star_cost: hotel_prices[0], two_star_cost: hotel_prices[1], three_star_cost: hotel_prices[2], four_star_cost: hotel_prices[3], five_star_cost: hotel_prices[4]})
  end

  def daily_average_cost
    doc.css('.innerWidth').children.each do |p|
      if p.text.include?("Business or regular tourist estimated")
        return p.text.split.last.gsub(/\u00A0\$/, "").to_f
      end
    end
  end

  def hotel_prices
    output = []
    i = 1
    doc.css('.hotel_outline_box td').each do |price|
      output.push(price.content.gsub(/\u00A0\$/, "").to_f) if (i+1)%4 == 0
      i+=1
    end
    output
  end

  # def tourist_food_and_transportation
  #   sum = 0.00
  #   i = 0
  #   parse_hotel_prices.each do |price|
  #     sum += price.to_f
  #     i+=1
  #   end
  #   average_hotel_price = sum / i
  #   tourist_average_cost.to_f - average_hotel_price
  # end
end
