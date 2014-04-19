class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :instructions
      t.varchar :servings
      t.integer :category_id
      t.text :url

      t.timestamps
    end
  end
end
