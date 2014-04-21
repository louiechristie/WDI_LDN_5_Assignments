class CreateIngridientsRecipes < ActiveRecord::Migration
  def change
    create_table :ingridients_recipes do |t|
      t.integer :ingridient_id
      t.integer :recipe_id
      t.integer :quantity
      t.string :measure

      t.timestamps
    end
  end
end
