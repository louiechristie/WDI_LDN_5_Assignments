class Ingredient < ActiveRecord::Base
  has_one :recipe
  attr_accessible :name, :quantity, :unit, :recipe_id
end
