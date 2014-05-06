class CreateMoviesTable < ActiveRecord::Migration
 
  def change
    create_table :movies do |t|

      t.string :title
      t.text :review
      t.integer :format_id

      t.timestamps
    end
  end

 
end
