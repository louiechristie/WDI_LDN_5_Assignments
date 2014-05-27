class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
      t.string :title
      t.string :artist
      t.string :description
      t.decimal :price
      t.string :image
      t.references :gallery

      t.timestamps
    end
    add_index :paintings, :gallery_id
  end
end
