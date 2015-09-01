class Airport < ActiveRecord::Base
  belongs_to(:cities)
end
