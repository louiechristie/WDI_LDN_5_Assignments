class ChangeIngredientsAndRecipesName < ActiveRecord::Migration
  def change
    rename_table :ingredients_recipes, :ingredientsrecipes
  end
end
