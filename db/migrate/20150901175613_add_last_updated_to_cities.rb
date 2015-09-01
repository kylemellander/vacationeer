class AddLastUpdatedToCities < ActiveRecord::Migration
  def change
    add_column(:cities, :last_updated, :timestamp)
  end
end
