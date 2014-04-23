class Ingredient < ActiveRecord::Base
  attr_accessible :name, :recipe_ids
  validates :name, presence: true
  validates :name, uniqueness: true

  has_and_belongs_to_many :recipes
end
