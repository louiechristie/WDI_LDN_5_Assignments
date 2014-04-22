class ChangeIngredientsAndRecipesName < ActiveRecord::Migration
  def change
    rename_table :ingredients_recipes, :quantities

    add_column :quantities, :id, :primary_key
    add_column :quantities, :quantity, :integer
    add_column :quantities, :measure, :string 
    add_column :quantities, :created_at, :datetime
    add_column :quantities, :updated_at, :datetime

    remove_column :recipes, :ingredient_id
    remove_column :recipes, :ingredient_id
  end

end
