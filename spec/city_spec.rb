require 'spec_helper'

describe City do
  it('returns flight costs from one destination to all stored cities') do
    city = City.create({:city_name => 'Seattle, WA', :country_name => 'United States'})
    Airport.create({:airport_code => "SEA", :city_id => city.id})
    city2 = City.create({:city_name => 'Philadelphia, PA', :country_name => 'United States'})
    Airport.create({:airport_code => "PHL", :city_id => city2.id})
    city2.flight_cost
    expect(Origin.all).to eq("whatever")
  end
end
