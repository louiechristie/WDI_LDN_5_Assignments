class Ingredient < ActiveRecord::Base
  attr_accessible :calories, :image, :name, :unit, :quantity

 has_many :ingredients, through: :ingredients_recipes
 has_many :ingredients_recipes
  

end

