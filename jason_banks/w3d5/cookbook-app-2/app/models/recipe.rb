class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :description, :image, :instructions, :prep_time, :name, :ingredients_recipes_attributes
  validates :description, :instructions, :name, presence: true

  belongs_to :category
  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes

  accepts_nested_attributes_for :ingredients_recipes, allow_destroy: true
end
