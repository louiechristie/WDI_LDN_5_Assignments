class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :name, :serving_size, :picture, :ingredient_id, :ingredient_ids

  belongs_to :category
has_many :ingredients_recipes

has_many :ingredients, through: :ingredients_recipes


  validates :name, presence: true



end
