class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :instructions, :name, :servings, :url, :image, :ingredients, :ingredient_ids, :ingredients_recipes_attributes

  belongs_to :category
  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes
  accepts_nested_attributes_for :ingredients_recipes
  validates :name, presence: true
  # validates :ingredients, presence: true
end
