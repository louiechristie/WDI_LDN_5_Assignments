class Ingredient < ActiveRecord::Base
  attr_accessible :calories, :image, :name, :unit, :quantity

 has_many :recipes, through: :ingredients_recipes
 has_many :ingredients_recipes
  
 default_scope order(:name)

end

