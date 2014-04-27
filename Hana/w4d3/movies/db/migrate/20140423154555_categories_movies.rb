class CategoriesMovies < ActiveRecord::Migration
  def change
    create_table :categories_movies, :id => false do |t|
      t.integer :category_id  
      t.integer :movie_id
    end
  end
end
