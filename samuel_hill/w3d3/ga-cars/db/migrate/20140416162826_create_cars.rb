class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :colour
      t.float :engine_size
      t.text :image
      t.string :category

      t.timestamps
    end
  end
end
