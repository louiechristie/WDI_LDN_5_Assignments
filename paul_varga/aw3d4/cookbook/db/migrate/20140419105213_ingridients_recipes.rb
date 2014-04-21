class IngridientsRecipes < ActiveRecord::Migration
  def change
  create_table :ingridients_recipes, :id => false do |t|

      t.integer :ingridient_id
      t.integer :recipe_id
    end
  end
end
