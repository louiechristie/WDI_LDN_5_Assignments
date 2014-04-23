class Actor < ActiveRecord::Base
  attr_accessible :name, :movie_ids

  has_and_belongs_to_many :movies

  default_scope order(:name)

  validates_uniqueness_of :name
end
