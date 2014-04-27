class Recipe < ActiveRecord::Base
  attr_accessible :category_id, :name, :serving_size, :ingredient_ids

  belongs_to :category
  has_and_belongs_to_many :ingredients

  validates :category_id, presence: true

  validates :name, presence: true
  validates :name, length: {minimum: 2}
  validates :name, length: {maximum: 100}
  validates :name, uniqueness: true

  validates :serving_size, numericality: {only_integer: true}

end
