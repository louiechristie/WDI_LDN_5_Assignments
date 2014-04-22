class Quantity < ActiveRecord::Base
  attr_accessible :ingredient_id, :measure, :quantity, :recipe_id

  belongs_to :recipe
  belongs_to :ingredient
end
