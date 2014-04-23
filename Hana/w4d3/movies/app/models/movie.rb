class Movie < ActiveRecord::Base
  attr_accessible :movie_image, :rating, :review, :title, :venue, :category_ids

  has_and_belongs_to_many :categories
end
