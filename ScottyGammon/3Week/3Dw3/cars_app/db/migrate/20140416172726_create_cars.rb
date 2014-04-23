class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.integer :year
      t.string :color
      t.string :category

      t.timestamps
    end
  end
end
