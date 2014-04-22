class Ingredient < ActiveRecord::Base
  attr_accessible :name

has_many :ingredients_recipes
has_many :recipes, through: :ingredients_recipes

validates :name, presence: true
validates :name, uniqueness: true
validates :name, length: {minimum: 2}
validates :name, length: {maximum: 50}




end