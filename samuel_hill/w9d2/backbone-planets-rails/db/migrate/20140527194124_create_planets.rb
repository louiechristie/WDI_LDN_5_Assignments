class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name
      t.integer :moons
      t.integer :mass

      t.timestamps
    end
  end
end
