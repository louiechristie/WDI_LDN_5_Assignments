class AddIdAndOtherColumnsToIngredientsRecipes < ActiveRecord::Migration
  def change
    add_column :ingredients_recipes, :id, :primary_key
    add_column :ingredients_recipes, :quantity, :decimal
    add_column :ingredients_recipes, :created_at, :datetime
    add_column :ingredients_recipes, :updated_at, :datetime
  end
end
