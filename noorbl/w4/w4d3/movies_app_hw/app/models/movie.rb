class Movie < ActiveRecord::Base
  attr_accessible :actor, :description, :director, :review, :title, :trailer_url, :category_id, :movie_image

  mount_uploader :movie_image, MovieImageUploader

  belongs_to :category

end
