class Recipe < ActiveRecord::Base
  attr_accessible :name, :category_id, :feeds, :ingredient_ids
  belongs_to :category
  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes

  accepts_nested_attributes_for :ingredients

end
