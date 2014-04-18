class Engine < ActiveRecord::Base
  attr_accessible :fuel, :size, :engine_id

  has_many :cars
end
