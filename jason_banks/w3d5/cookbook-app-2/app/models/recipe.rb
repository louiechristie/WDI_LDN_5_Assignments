class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :description, :image, :instructions, :prep_time, :title
  validates :description, :instructions, :title, presence: true

  belongs_to :category
  has_many :quantities
  has_many :ingredients, through: :quantities

  accepts_nested_attributes_for :ingredients, :quantities
end
