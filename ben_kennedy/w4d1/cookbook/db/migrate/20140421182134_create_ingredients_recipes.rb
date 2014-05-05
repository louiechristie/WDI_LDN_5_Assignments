class CreateIngredientsRecipes < ActiveRecord::Migration
  def change
    create_table :ingredients_recipes do |t|
      t.belongs_to :recipe
      t.belongs_to :ingredient
      t.string :quantity

      t.timestamps
    end
  end
end
