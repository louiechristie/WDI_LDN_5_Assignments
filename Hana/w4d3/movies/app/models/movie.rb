class Movie < ActiveRecord::Base
  attr_accessible :movie_image, :rating, :review, :title, :venue, :category_ids, :movie_image, :remove_movie_image, :categories_movies_attributes

  mount_uploader :movie_image, MovieImageUploader
  
  has_and_belongs_to_many :categories

  

  mount_uploader :movie_image, MovieImageUploader
end
