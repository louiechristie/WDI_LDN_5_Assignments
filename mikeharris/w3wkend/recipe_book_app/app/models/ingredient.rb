class Ingredient < ActiveRecord::Base
  attr_accessible :calories, :image, :name, :unit

  has_and_belongs_to_many :recipes

  
end

