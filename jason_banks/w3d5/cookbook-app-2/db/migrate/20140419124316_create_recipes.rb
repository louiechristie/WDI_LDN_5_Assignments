class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.integer :prep_time, default: 0
      t.text :description, null: false
      t.text :instructions, null: false
      t.text :image

      t.timestamps
    end
  end
end
