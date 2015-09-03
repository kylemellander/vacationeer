class Airport < ActiveRecord::Base
  belongs_to(:cities)
  require "httparty"
end
