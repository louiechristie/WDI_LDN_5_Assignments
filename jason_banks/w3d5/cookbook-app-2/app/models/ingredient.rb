class Ingredient < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :quantities
  has_many :recipes, through: :quantities
  accepts_nested_attributes_for :recipes
end
