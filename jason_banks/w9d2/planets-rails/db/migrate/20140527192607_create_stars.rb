class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.string :name
      t.string :mass
      t.string :classification
      t.string :luminosity

      t.timestamps
    end
  end
end
