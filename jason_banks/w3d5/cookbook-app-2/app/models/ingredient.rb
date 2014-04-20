class Ingredient < ActiveRecord::Base
  attr_accessible :name, :recipe_ids
  validates :name, presence: true

  has_and_belongs_to_many :recipes
end
