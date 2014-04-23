class Movie < ActiveRecord::Base
  attr_accessible :name, :rating, :review, :year, :category_ids, :actor_id, :actor_ids, :actors_movies_attributes

  has_and_belongs_to_many :categories

  has_many :actors_movies
  has_many :actors, through: :actors_movies

  validates :name, presence: true
end
