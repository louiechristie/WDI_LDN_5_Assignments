class CreateJoinTableIngredientsRecipes < ActiveRecord::Migration
  def change
    create_table(:ingredients_recipes, id: false) do |t|
       t.integer :recipe_id 
       t.integer :ingredient_id
       t.integer :quantity
    end
  end
end