class Category < ActiveRecord::Base
  attr_accessible :name

has_many :recipes

validates :name, presence: true
validates :name, uniqueness: true
validates :name, length: {minimum: 2}
validates :name, length: {maximum: 30}




end
