class Recipe < ActiveRecord::Base
  attr_accessible :description, :feeds, :image, :name, :time, :category_id

  belongs_to :category
end
