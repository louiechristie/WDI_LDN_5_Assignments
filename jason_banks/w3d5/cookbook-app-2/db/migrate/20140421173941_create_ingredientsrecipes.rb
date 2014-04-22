class CreateIngredientsrecipes < ActiveRecord::Migration
  def change
    create_table :ingredientsrecipes do |t|
      t.integer, :recipe_id
      t.integer, :ingredient_id
      t.integer, :quantity
      t.string :measure

      t.timestamps
    end
  end
end
