class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :name, :size

  belongs_to :category
end
