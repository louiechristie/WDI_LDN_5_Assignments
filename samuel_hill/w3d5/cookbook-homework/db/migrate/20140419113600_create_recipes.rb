class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :feeds
      t.text :instructions
      t.integer :category_id

      t.timestamps
    end
  end
end
