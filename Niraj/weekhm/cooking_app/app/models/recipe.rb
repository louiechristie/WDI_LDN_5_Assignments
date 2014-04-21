class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :name, :serving_size, :picture, :ingredient_id, :ingredient_ids

  has_many :ingredients

end
