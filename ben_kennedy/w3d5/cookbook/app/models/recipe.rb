class Recipe < ActiveRecord::Base
  belongs_to :category
  has_many :ingredients
  attr_accessible :feeds, :name, :category_id

  validates :name, presence: true
  validates :feeds, numericality: { only_integer: true}


end
