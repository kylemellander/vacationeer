class AddCostsToCities < ActiveRecord::Migration
  def change
    add_column(:cities, :transportation_cost, :float)
    add_column(:cities, :food_cost, :float)
    add_column(:cities, :accomodation_cost, :float)
  end
end
