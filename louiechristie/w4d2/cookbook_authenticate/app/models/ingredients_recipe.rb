class IngredientsRecipe < ActiveRecord::Base
  attr_accessible :ingredient_id, :measure, :quantity, :recipe_id
  belongs_to :ingredient
  belongs_to :recipe
end
