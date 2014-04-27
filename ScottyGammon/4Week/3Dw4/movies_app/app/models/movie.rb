class Movie < ActiveRecord::Base
  attr_accessible :genre, :poster, :title, :year, :review
end