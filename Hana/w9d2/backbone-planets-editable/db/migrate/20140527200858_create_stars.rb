class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.string :name
      t.string :url
      t.string :distance
      t.string :luminosity

      t.timestamps
    end
  end
end
