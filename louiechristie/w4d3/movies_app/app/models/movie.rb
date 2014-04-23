class Movie < ActiveRecord::Base
  attr_accessible :plot, :review, :title, :year
end
