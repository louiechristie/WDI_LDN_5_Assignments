class Category < ActiveRecord::Base
  attr_accessible :image, :name
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :recipes, dependent: :destroy
end
