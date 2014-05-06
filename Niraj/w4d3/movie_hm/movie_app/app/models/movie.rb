class Movie < ActiveRecord::Base
  attr_accessible :title, :year, :genre, :actors
end
