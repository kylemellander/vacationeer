class SetAvgDefaultValue < ActiveRecord::Migration
  def change
    change_column :cities, :daily_average_cost, :float, :default => 0.0
  end
end
