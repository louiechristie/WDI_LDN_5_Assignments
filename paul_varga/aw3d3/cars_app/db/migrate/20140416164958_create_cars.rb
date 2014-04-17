class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.string :color
      t.string :building
      t.integer :year
      t.text :description
      t.text :image

      t.timestamps
    end
  end
end
