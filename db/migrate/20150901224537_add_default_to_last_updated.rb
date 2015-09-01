class AddDefaultToLastUpdated < ActiveRecord::Migration
  def change
    change_column :cities, :last_updated, :timestamp, :default => Time.new(2000)
  end
end
