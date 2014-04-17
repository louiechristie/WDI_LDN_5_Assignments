class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.float :value
      t.text :description
      t.text :image

      t.timestamps
    end
  end
end
