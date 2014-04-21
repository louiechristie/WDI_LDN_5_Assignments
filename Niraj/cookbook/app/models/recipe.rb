class Recipe < ActiveRecord::Base
  attr_accessible :description, :instructions, :published_date, :title, :category_id

  belongs_to :category
end
