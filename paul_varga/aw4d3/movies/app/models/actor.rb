class Actor < ActiveRecord::Base
  attr_accessible :name, :movie_id

  has_many :actors_movies
  has_many :movies, through: :actors_movies

  validates :name, presence: true
  validates :name, length: {minimum: 2}
end
