class AddActivitiesTable < ActiveRecord::Migration
  def change
    create_table(:activities) do |t|
      t.column(:name, :string)
      t.column(:group, :string)

      t.timestamps()
    end

    create_table(:activities_cities) do |t|
      t.column(:activity_id, :int)
      t.column(:city_id, :int)
    end
  end
end
