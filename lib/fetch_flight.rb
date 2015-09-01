require 'nokogiri'
require 'open-uri'

class Array
  def parse_hotel_prices
    doc = Nokogiri::HTML(open('http://www.numbeo.com/hotel-prices/city_result.jsp?country=Japan&city=Tokyo&displayCurrency=USD'))
    output = []
    i = 1
    doc.css('.hotel_outline_box td').each do |price|
      output.push(price.content.gsub(/\$/, "").gsub(/\u00A0/, "")) if (i+1)%4 == 0
      i+=1
    end
    output
  end
end
