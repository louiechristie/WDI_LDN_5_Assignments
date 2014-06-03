class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name
      t.string :mass
      t.text :image
      t.integer :moons

      t.timestamps
    end
  end
end
