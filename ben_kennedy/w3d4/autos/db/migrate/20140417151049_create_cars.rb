class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :year
      t.string :mileage
      t.text :description

      t.timestamps
    end
  end
end
