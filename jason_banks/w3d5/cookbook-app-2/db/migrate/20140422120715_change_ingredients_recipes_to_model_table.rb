class ChangeIngredientsRecipesToModelTable < ActiveRecord::Migration
  def up
    remove_column :ingredients_recipes, :id, :primary_key
    remove_column :ingredients_recipes, :quantity, :string
    remove_column :ingredients_recipes, :created_at, :datetime
    remove_column :ingredients_recipes, :updated_at, :datetime
    
    add_column :ingredients_recipes, :id, :primary_key
    add_column :ingredients_recipes, :quantity, :string
    add_column :ingredients_recipes, :created_at, :datetime
    add_column :ingredients_recipes, :updated_at, :datetime

    IngredientsRecipe.all.each do |ir|
      ir.created_at = Time.now
      ir.updated_at = ir.created_at
      ir.save!
    end

    change_column :ingredients_recipes, :created_at, :datetime, null: false
    change_column :ingredients_recipes, :updated_at, :datetime, null: false

    add_index :ingredients_recipes, :recipe_id
    add_index :ingredients_recipes, :ingredient_id
  end

  def down

    remove_column :ingredients_recipes, :id, :primary_key
    remove_column :ingredients_recipes, :quantity, :string
    remove_column :ingredients_recipes, :created_at, :datetime
    remove_column :ingredients_recipes, :updated_at, :datetime

    remove_index :ingredients_recipes, :recipe_id
    remove_index :ingredients_recipes, :ingredient_id

  end
end
