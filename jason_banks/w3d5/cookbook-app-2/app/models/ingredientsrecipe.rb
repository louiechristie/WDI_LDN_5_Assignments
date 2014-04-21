class Ingredientsrecipe < ActiveRecord::Base
  attr_accessible :ingredient_id, :measure, :quantity, :recipe_id
end
