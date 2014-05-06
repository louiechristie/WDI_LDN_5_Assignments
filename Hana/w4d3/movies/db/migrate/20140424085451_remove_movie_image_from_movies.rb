class RemoveMovieImageFromMovies < ActiveRecord::Migration
  def up
    remove_column :movies, :movie_image
  end

  def down
    add_column :movies, :movie_image, :string
  end
end
