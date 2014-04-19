class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :description, :image, :instructions, :prep_time, :title
  validates :description, :instructions, :title, presence: true

  belongs_to :category
  has_and_belongs_to_many :ingredients
end
