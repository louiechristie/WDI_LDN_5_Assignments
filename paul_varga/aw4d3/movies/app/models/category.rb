class Category < ActiveRecord::Base
  attr_accessible :name, :movie_ids

  has_and_belongs_to_many :movies

  validates :name, presence: true
  validates :name, length: {minimum: 2}
  validates :name, length: {maximum: 20}

end
