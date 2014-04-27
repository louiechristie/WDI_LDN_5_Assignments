class IngredientsRecipe < ActiveRecord::Base
  attr_accessible :recipe_id, :ingredient_id, :quantity

  belongs_to :ingredient
  belongs_to :recipe







end
