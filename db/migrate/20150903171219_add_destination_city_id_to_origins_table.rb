class AddDestinationCityIdToOriginsTable < ActiveRecord::Migration
  def change
    add_column(:origins, :city_id, :integer)
  end
end
