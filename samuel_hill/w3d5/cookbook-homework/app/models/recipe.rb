 class Recipe < ActiveRecord::Base

  attr_accessible :category_id, :feeds, :instructions, :name, :ingredient_ids

  belongs_to :category	

  has_and_belongs_to_many :ingredients

  validates :name, presence: true
  validates :feeds, numericality: { greater_than: 0 }
  validates :instructions, presence: true
  validates :ingredient_ids, presence: true
  
end
