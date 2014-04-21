class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.string :colour
      t.text :image
      t.integer :max_speed

      t.timestamps
    end
  end
end
