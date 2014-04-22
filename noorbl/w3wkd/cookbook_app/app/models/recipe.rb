class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :name, :serving_size

  belongs_to :categories
end
