class Movie < ActiveRecord::Base
  attr_accessible :rating, :review, :title, :how_viewed

  validates :title, :rating, :how_viewed, presence: true
end
