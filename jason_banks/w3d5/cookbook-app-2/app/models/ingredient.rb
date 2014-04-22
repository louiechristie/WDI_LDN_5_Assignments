class Ingredient < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :ingredients_recipes
  has_many :recipes, through: :ingredients_recipes

end
