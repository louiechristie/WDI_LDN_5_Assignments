class IngredientsRecipe < ActiveRecord::Base
  attr_accessible :ingredient_id, :quantity, :recipe_id

  belongs_to :ingredient
  belongs_to :recipe

  
end
