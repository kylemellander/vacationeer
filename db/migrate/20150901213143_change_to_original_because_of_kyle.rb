class ChangeToOriginalBecauseOfKyle < ActiveRecord::Migration
  def change
    drop_table(:accomodations)
    add_column(:cities, :one_star_cost, :float)
    add_column(:cities, :two_star_cost, :float)
    add_column(:cities, :three_star_cost, :float)
    add_column(:cities, :four_star_cost, :float)
    add_column(:cities, :five_star_cost, :float)
  end
end
