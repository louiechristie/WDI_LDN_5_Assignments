class Ingredient < ActiveRecord::Base
  attr_accessible :name, :recipe_ids
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :ingredientsrecipes
  has_many :recipes, through: :ingredientsrecipes

  accepts_nested_attributes_for :recipes
end
