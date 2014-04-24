class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :review
      t.text :poster
      t.string :genre
      t.string :ownership

      t.timestamps
    end
  end
end
