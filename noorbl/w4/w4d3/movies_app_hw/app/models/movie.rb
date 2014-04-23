class Movie < ActiveRecord::Base
  attr_accessible :actor, :description, :director, :review, :title, :trailer_url
end
