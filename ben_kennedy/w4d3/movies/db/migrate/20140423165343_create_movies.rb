class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.belongs_to :where_watched
      t.string :name
      t.text :review
      t.integer :where_watched_id
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
