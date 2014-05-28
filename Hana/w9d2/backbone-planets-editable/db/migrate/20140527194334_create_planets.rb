class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name
      t.string :url
      t.integer :moons
      t.string :diameter
      t.string :temp

      t.timestamps
    end
  end
end
