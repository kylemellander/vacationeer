class AddDailyAverageCostToCitiesTable < ActiveRecord::Migration
  def change
    add_column(:cities, :daily_average_cost, :float)
  end
end
