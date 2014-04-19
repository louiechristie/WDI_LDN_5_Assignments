class Recipe < ActiveRecord::Base
  attr_accessible :image, :instructions, :prep_time, :title, :category_id
  validates :instructions, :prep_time, :title, presence: true

end
