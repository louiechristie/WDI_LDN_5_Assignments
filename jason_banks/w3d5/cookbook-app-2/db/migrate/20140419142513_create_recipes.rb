class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :prep_time
      t.text :instructions, null: false
      t.string :image
      t.integer :category_id

      t.timestamps
    end
  end
end
