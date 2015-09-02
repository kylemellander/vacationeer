require 'spec_helper'

describe Airport do
  it('returns a list of flights') do
    city = City.create({:city_name => 'Seattle, WA', :country_name => 'United States'})
    airport_test = Airport.create({:airport_code => "SEA", :city_id => city.id})
    result = airport_test.airport_data
    expect(result).to eq ("blah blah")
  end
end
