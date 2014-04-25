class IngredientsRecipe < ActiveRecord::Base
  attr_accessible :ingredient_id, :quantity, :recipe_id, :ingredients_recipes_attributes
  belongs_to :ingredient
  belongs_to :recipe

  accepts_nested_attributes_for :ingredient
end
