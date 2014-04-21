class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :instructions, :name, :servings, :url, :image, :ingredients, :ingredient_ids

  belongs_to :category
  has_and_belongs_to_many :ingredients
end
