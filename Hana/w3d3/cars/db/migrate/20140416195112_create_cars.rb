class CreateCars < ActiveRecord::Migration
  def change
      create_table :cars do |t|
        t.string :name
        t.string :make
        t.integer :year
        t.float :value
        t.text :description
        t.text :image

        t.timestamps  
    end
  end
end
