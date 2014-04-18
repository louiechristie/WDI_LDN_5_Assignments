class Engine < ActiveRecord::Base
	
  attr_accessible :fuel_type, :model, :size

  has_many :cars
  
end
