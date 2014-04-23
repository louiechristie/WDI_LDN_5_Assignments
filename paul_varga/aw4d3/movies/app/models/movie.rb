class Movie < ActiveRecord::Base
  attr_accessible :name, :rating, :review, :year, :category_ids

  has_and_belongs_to_many :categories

  validates :name, presence: true
end
