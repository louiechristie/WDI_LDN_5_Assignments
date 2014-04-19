class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :instructions, :name, :servings, :link

  belongs_to :category
  has_and_belongs_to_many :ingredients
end
