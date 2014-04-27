 class Recipe < ActiveRecord::Base

  attr_accessible :category_id, :feeds, :instructions, :name, :ingredient_ids, :ingredients_recipes_attributes

  belongs_to :category	

  has_many :ingredients, through: :ingredients_recipes
  has_many :ingredients_recipes

  accepts_nested_attributes_for :ingredients_recipes

  validates :name, presence: true
  validates :feeds, numericality: { greater_than: 0 }
  validates :instructions, presence: true
  validates :ingredient_ids, presence: true
  
end
