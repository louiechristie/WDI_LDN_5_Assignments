class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :recipes, dependent: :destroy

  validates :name, presence: true;
  validates :name, length: {minimum: 2}
  validates :name, length: {maximum: 20}
end
