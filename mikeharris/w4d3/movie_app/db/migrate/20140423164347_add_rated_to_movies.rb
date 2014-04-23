class AddRatedToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :rated, :string
    add_column :movies, :director, :string
    add_column :movies, :actors, :string
    add_column :movies, :plot, :string
    add_column :movies, :imdbRating, :integer
    add_column :movies, :poster, :string
    
    add_column :movies, :runtime, :string

  end
end

