require 'nokogiri'
require 'open-uri'

class Array
  def parse_flights
    doc = Nokogiri::HTML(open('http://www.numbeo.com/hotel-prices/city_result.jsp?country=Japan&city=Tokyo&displayCurrency=USD'))
    output = []
    doc.css('.priceValue').each do |price|
      output.push(price.content)
    end
    output
  end
end
