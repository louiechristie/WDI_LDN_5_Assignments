class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.integer :rated
      t.integer :released
      t.integer :runtime
      t.string :genre
      t.string :director
      t.string :writers
      t.string :actors
      t.string :plot

      t.timestamps
    end
  end
end
