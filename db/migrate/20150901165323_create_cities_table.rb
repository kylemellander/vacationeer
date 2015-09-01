class CreateCitiesTable < ActiveRecord::Migration
  def change
    create_table(:cities) do |t|
      t.column(:city_name, :string)
    end
    create_table(:airports) do |t|
      t.column(:airport_code, :string)
      t.column(:city_id, :integer)
    end
  end
end
