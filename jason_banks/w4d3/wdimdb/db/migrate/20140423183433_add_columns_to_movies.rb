class AddColumnsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :director, :string
    add_column :movies, :actors, :text
    add_column :movies, :plot, :text
    add_column :movies, :image, :text
  end
end
