class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name
      t.integer :moons
      t.integer :size
      t.integer :dist_from_sun

      t.timestamps
    end
  end
end
