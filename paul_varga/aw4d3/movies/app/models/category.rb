class Category < ActiveRecord::Base
  attr_accessible :name, :movie_ids

  has_and_belongs_to_many :movies
end
