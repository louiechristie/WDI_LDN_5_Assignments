class Movie < ActiveRecord::Base
  attr_accessible :director_id, :genre, :title, :year,
  :rated, :director, :actors, :plot, :imdbRating, :poster,  :runtime, :actor_ids

  has_and_belongs_to_many :actors
  has_and_belongs_to_many :users
  
  default_scope order(:title)

  validates :title, presence: true
  validates_uniqueness_of :title
end


