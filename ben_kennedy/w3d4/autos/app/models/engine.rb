class Engine < ActiveRecord::Base
  attr_accessible :fuel_type, :power

  has_many :cars
end
