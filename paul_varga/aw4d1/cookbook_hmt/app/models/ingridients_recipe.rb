class IngridientsRecipe < ActiveRecord::Base
  attr_accessible :ingridient_id, :measure, :quantity, :recipe_id, :ingridient_attributes

  belongs_to :ingridient
  belongs_to :recipe
  attr_accessible :quantity

  accepts_nested_attributes_for :ingridient
end
