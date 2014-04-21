class Engine < ActiveRecord::Base
  attr_accessible :name, :cylinders, :fuel_type, :power

  has_many :cars
end
