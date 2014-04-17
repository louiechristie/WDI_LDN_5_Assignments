class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name
      t.float :mass
      t.integer :moons, limit: 2
      t.float :orbit
      t.text :image

      t.timestamps
    end
  end
end
