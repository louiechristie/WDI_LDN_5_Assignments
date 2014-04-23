class Movie < ActiveRecord::Base
  attr_accessible :rating, :review, :title, :how_viewed
end
