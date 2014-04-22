class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :name, :size, :picture

  belongs_to :category 

  validates :name, presence: true
  validates :size, numericality: {greater_than: 1}
  validates :category_id, numericality: {integer: true}
end
