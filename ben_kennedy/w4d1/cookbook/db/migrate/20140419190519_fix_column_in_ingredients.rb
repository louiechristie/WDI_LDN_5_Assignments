class FixColumnInIngredients < ActiveRecord::Migration
  def change
    rename_column :ingredients, :recipe_id_id, :recipe_id
  end
end
