class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name
      t.float :volume
      t.string :url

      t.timestamps
    end
  end
end
