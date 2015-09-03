require 'nokogiri'
require 'open-uri'
require 'pry'


class City < ActiveRecord::Base
  has_many(:airports)
  has_many(:origins)
  has_and_belongs_to_many(:activities)
  validates(:city_name, :country_name, presence: true)
  before_save(:city_data)

  def city_data
    if self.last_updated < (Time.now - 1.day)
      @doc = Nokogiri::HTML(open("http://www.numbeo.com/hotel-prices/city_result.jsp?country=#{country_name.gsub(/ /, "+")}&city=#{city_name.gsub(/, /, "%2C+").gsub(/ /, "+")}&displayCurrency=USD"))
      self.update({daily_average_cost: daily_average_cost_calc, food_cost: food_price_calc, last_updated: Time.now, transportation_cost: transportation_cost_calc, one_star_cost: hotel_prices[0], two_star_cost: hotel_prices[1], three_star_cost: hotel_prices[2], four_star_cost: hotel_prices[3], five_star_cost: hotel_prices[4]})
    end
  end

  def flight_cost
    # if self.last_updated < (Time.now - 1.day)
    total_flight_cost = 0
    City.all.each do |city|
      binding.pry
      doc = Nokogiri::HTML(open("http://www.faredetective.com/farehistory/flights-from-Portland-PDX-to-#{city.city_name.split(",").first}-#{city.airports.first.airport_code}.html"))
      doc.css('.div7').each do |flight_info|
        total_flight_cost = flight_info.text.split("Average price: ")[1].split("Cheapest months to travel: ")[0].to_i
      end
      Origin.create({:name => "PDX", :cost => total_flight_cost, :city_id => city.id})
    end
    # end
  end


private

  def city_name_only
    self.city_name.split(",").first
  end

  def daily_average_cost_calc
    @doc.css('.innerWidth').children.each do |p|
      if p.text.include?("Business or regular tourist estimated")
        return p.text.split.last.gsub(/\u00A0\$/, "").to_f.round(2)
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

  def average_hotel_cost
    sum = 0.00
    i = 0
    hotel_prices.each do |price|
      sum += price.to_f
      i+=1
    end
    sum / i
  end

  def transportation_cost_calc
    (daily_average_cost_calc - food_price_calc - average_hotel_cost).round(2)
  end

end
