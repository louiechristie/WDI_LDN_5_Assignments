class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :description, :image, :instructions, :prep_time, :title, :ingredient_ids
  validates :description, :instructions, :title, presence: true

  belongs_to :category
  has_many :ingredientsrecipes
  has_many :ingredients, through: :ingredientsrecipes

  # accepts_nested_attributes_for :ingredients
end
