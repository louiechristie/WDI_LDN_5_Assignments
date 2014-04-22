class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :name, :size, :picture

  belongs_to :category 

  has_many :ingredients, through: :ingredients_recipes
  has_many :ingredients_recipes

  validates :name, presence: true
  validates :size, numericality: {greater_than: 1}
  validates :category_id, numericality: {integer: true}
end
