class Movie < ActiveRecord::Base
  attr_accessible :genre, :poster, :title, :year, :review, :movie_image


  mount_uploader :movie_image, MovieImageUploader
end