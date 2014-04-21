class Recipe < ActiveRecord::Base
  attr_accessible :description, :feeds, :image, :name, :time, :category_id, :ingredient_ids

  belongs_to :category
  has_and_belongs_to_many :ingredients

  validates :name, presence: true
  validates :name, length: {minimum: 2}
  validates :name, length: {maximum: 20}
  validates :ingredient_ids, presence: true

end
