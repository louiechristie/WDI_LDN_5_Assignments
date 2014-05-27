class IngredientsRecipe < ActiveRecord::Base
  attr_accessible :ingredient_id, :recipe_id, :quantity

  belongs_to :ingredient
  belongs_to :recipe
end