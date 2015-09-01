require 'nokogiri'
require 'open-uri'

class City < ActiveRecord::Base

  def city_data
    @doc = Nokogiri::HTML(open("http://www.numbeo.com/hotel-prices/city_result.jsp?country=#{country_name.gsub(/ /, "+")}&city=#{city_name.gsub(/, /, "%2C+").gsub(/ /, "+")}&displayCurrency=USD"))
    self.update({daily_average_cost: daily_average_cost_calc, food_cost: food_price_calc, one_star_cost: hotel_prices[0], two_star_cost: hotel_prices[1], three_star_cost: hotel_prices[2], four_star_cost: hotel_prices[3], five_star_cost: hotel_prices[4]})
  end

  def daily_average_cost_calc
    @doc.css('.innerWidth').children.each do |p|
      if p.text.include?("Business or regular tourist estimated")
        return p.text.split.last.gsub(/\u00A0\$/, "").to_f
      end
    end
  end

  def hotel_prices
    output = []
    i = 1
    @doc.css('.hotel_outline_box td').each do |price|
      output.push(price.content.gsub(/\u00A0\$/, "").to_f.round(2)) if (i+1)%4 == 0
      i+=1
    end
    output
  end

  def food_price_calc
    food_price = 0.00
    i = 1
    @doc.css('.data_wide_table td').each do |price|
      if i < 8
        food_price += price.text.to_f
      end
      i += 1
    end
    food_price
  end

end
