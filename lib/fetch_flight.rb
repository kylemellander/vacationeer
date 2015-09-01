require 'nokogiri'
require 'open-uri'

class Array
  def parse_flights
    doc = Nokogiri::HTML(open('https://www.google.com/flights/#search;f=PDX;t=HND,NRT;'))
    output = []
    doc.css('div.I115RS-c-zb').each do |price|
      output.push(price.content)
    end
    output
    doc
  end
end
