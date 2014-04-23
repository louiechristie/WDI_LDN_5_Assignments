class Engine < ActiveRecord::Base
  attr_accessible :cylinders, :fuel_type, :power

has_many :vehicles

end
