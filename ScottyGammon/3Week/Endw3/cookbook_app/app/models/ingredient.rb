class Ingredient < ActiveRecord::Base
  attr_accessible :name, :picture


  has_many :recipes, through: :ingredients_recipes
  has_many :ingredients_recipes

  validates :name, presence: true
  
end
