class AddIngredientIdToRecipes < ActiveRecord::Migration
  def up
    add_column :recipes, :ingredient_ids, :integer
  end

  def down
  	remove_column :recipes, :ingredient_ids
  end
end
