require 'spec_helper'

describe City do
  it 'will fetch the price of a hotel from numbeo' do
    portland = City.create({city_name: "Portland, OR", country_name: "United States", daily_average_cost: 0.00})
    portland.city_data
    expect(portland.daily_average_cost).to eq(275.48)
  end

  # it 'will fetch the price of a hotel from numbeo' do
  #   test_array = ["Portland, OR", "United States"]
  #   expect(test_array.tourist_average_cost).to eq("275.48")
  # end
end
