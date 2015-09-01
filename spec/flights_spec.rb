require 'spec_helper'

describe Array do
  it 'will fetch the price of a hotel from numbeo' do
    test_array = ["Portland, OR", "United States"]
    expect(test_array.parse_hotel_prices).to eq(["49.99", "69.99", "104.00", "172.78", "278.84"])
  end

  it 'will fetch the price of a hotel from numbeo' do
    test_array = ["Portland, OR", "United States"]
    expect(test_array.tourist_average_cost).to eq("275.48")
  end
end
