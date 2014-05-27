class CreateGalaxies < ActiveRecord::Migration
  def change
    create_table :galaxies do |t|
      t.string :name
      t.integer :stars
      t.text :shape

      t.timestamps
    end
  end
end
