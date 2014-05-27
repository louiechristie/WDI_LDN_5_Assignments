class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name
      t.string :url
      t.integer :moons
      t.float :diameter
      t.float :temp

      t.timestamps
    end
  end
end
