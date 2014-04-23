class Recipe < ActiveRecord::Base
  belongs_to :category
  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes
  attr_accessible :feeds, :name, :category_id, :user_id, :ingredients_recipes_attributes

  validates :name, presence: true
  validates :feeds, numericality: { only_integer: true}
  validates :user_id, presence: true

  accepts_nested_attributes_for :ingredients_recipes
end
