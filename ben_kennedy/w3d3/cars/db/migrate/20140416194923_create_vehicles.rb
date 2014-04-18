class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :year
      t.text :image
      t.string :price
      t.string :mileage
      t.text :description
      t.text :distance

      t.timestamps
    end
  end
end
