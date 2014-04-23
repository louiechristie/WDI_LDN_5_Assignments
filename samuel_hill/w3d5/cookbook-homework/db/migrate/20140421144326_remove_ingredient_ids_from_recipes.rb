class RemoveIngredientIdsFromRecipes < ActiveRecord::Migration
  def up
    remove_column :recipes, :ingredient_ids
  end

  def down
    add_column :recipes, :ingredient_ids, :string
  end
end
