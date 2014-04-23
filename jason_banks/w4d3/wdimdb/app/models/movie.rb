class Movie < ActiveRecord::Base
  attr_accessible :rating, :review, :title, :where_viewed
end
