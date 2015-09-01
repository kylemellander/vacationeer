require 'spec_helper'

describe City do
  it 'will fetch the daily average cost from numbeo' do
    portland = City.create({city_name: "Portland, OR", country_name: "United States"})
    portland.city_data
    expect(portland.daily_average_cost).to eq(275.48)
  end

  it 'will fetch the daily food cost from numbeo' do
    portland = City.create({city_name: "Portland, OR", country_name: "United States"})
    portland.city_data
    expect(portland.food_cost).to eq(62.88)
  end

  it 'will fetch the price of a hotel from numbeo' do
    portland = City.create({city_name: "Portland, OR", country_name: "United States"})
    portland.city_data
    expect(portland.one_star_cost).to eq(49.99)
    expect(portland.two_star_cost).to eq(69.99)
    expect(portland.three_star_cost).to eq(104.00)
    expect(portland.four_star_cost).to eq(172.78)
  end

  it 'will fetch the daily transportation cost from numbeo' do
    portland = City.create({city_name: "Portland, OR", country_name: "United States"})
    portland.city_data
    expect(portland.transportation_cost).to eq(77.48)
  end

  it 'will update the values in the city table if it has been more than one day since it has been updated' do
    portland = City.create({city_name: "Portland, OR", country_name: "United States", last_updated: Time.now - 5.day})
    portland.city_data
    
    portland.update
    expect(portland.last_updated).to eq(Time.now)
  end

end
