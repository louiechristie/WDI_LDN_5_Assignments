class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :recipes

  validates :name, presence: true
  
end
