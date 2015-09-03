class OriginCost < ActiveRecord::Migration
  def change
      create_table(:origins) do |t|
      t.column(:name, :string)
      t.column(:cost, :integer)

      t.timestamps()
    end
  end
end
