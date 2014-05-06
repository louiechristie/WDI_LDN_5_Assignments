class WhereWatched < ActiveRecord::Base
  attr_accessible :location



  has_many :movies
end
