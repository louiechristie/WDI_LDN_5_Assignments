class ActorsMovie < ActiveRecord::Base
  attr_accessible :actor_id, :film_role, :movie_id, :actor_attributes

  belongs_to :actor
  belongs_to :movie

  accepts_nested_attributes_for :actor

end
