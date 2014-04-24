class MoviesUser < ActiveRecord::Base
  attr_accessible :movie_id, :user_id
end
