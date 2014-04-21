class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :name, :size, :picture

  belongs_to :category
end
