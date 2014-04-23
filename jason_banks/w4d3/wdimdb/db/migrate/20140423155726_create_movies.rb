class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :review
      t.integer :rating
      t.string :where_viewed

      t.timestamps
    end
  end
end
