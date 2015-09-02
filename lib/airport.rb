class Airport < ActiveRecord::Base
  belongs_to(:cities)
  require "httparty"

  # attr_accessor :cost
  #
  # def initialize(cost)
  #   self.cost = cost

  def airport_data
    answer = HTTParty.post("https://www.googleapis.com/qpxExpress/v1/trips/search?key=AIzaSyDqAnFxbvWwhyBZEGsZYN1lfGmIoOCE77k",
    :body => { request: { passengers: { adultCount: 1}, slice: [{origin: "PDX", destination: "SEA", date: "2015-09-25"},{origin: "SEA", destination: "PDX", date: "2015-10-10"}]}}.to_json,
    :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'})
    answer
  end
end
