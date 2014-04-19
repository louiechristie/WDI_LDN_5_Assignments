class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :description, :image, :instructions, :prep_time, :title
  validates :description, :instructions, :title, presence: true
end
