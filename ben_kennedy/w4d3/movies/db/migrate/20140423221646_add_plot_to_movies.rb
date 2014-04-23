class AddPlotToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :plot, :text
  end
end
