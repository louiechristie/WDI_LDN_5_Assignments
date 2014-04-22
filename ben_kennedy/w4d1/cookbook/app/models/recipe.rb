class Recipe < ActiveRecord::Base
  belongs_to :category
  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes
  attr_accessible :feeds, :name, :category_id

  validates :name, presence: true
  validates :feeds, numericality: { only_integer: true}


end
