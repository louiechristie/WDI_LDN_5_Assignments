class IngridientsRecipe < ActiveRecord::Base
  attr_accessible :ingridient_id, :measure, :quantity, :recipe_id

  belongs_to :ingridient
  belongs_to :recipe
end
