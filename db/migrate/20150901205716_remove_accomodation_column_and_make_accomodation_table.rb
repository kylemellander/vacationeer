class RemoveAccomodationColumnAndMakeAccomodationTable < ActiveRecord::Migration
  def change
    remove_column(:cities, :accomodation_cost)
    create_table(:accomodations) do |t|
      t.column(:one_star_cost, :float)
      t.column(:two_star_cost, :float)
      t.column(:three_star_cost, :float)
      t.column(:four_star_cost, :float)
      t.column(:five_star_cost, :float)
      t.column(:city_id, :integer)
    end
  end
end
