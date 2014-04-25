class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :poster
      t.integer :year
      t.string :genre

      t.timestamps
    end
  end
end
