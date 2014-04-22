class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :name, :serving_size, :ingredient_ids

  belongs_to :category

  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes

  validates :category_id, presence: true

  validates :name, presence: true
  validates :name, length: {minimum: 2}
  validates :name, length: {maximum: 100}
  validates :name, uniqueness: true

  validates :serving_size, numericality: {only_integer: true}

end
