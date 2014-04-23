class Movie < ActiveRecord::Base
  attr_accessible :rating, :review, :title, :how_viewed, :director, :actors, :plot, :image

  validates :title, :rating, :how_viewed, presence: true
  validates :plot, uniqueness: true
end
