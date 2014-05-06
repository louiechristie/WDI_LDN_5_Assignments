class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.text :review
      t.integer :rating
      t.integer :year

      t.timestamps
    end
  end
end
