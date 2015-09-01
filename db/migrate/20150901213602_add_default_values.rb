class AddDefaultValues < ActiveRecord::Migration
  def change
    change_column :cities, :transportation_cost, :float, :default => 0.0
    change_column :cities, :food_cost, :float, :default => 0.0
    change_column :cities, :one_star_cost, :float, :default => 0.0
    change_column :cities, :two_star_cost, :float, :default => 0.0
    change_column :cities, :three_star_cost, :float, :default => 0.0
    change_column :cities, :four_star_cost, :float, :default => 0.0
    change_column :cities, :five_star_cost, :float, :default => 0.0
  end
end
