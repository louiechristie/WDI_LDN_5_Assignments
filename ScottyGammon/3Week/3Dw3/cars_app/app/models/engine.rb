class Engine < ActiveRecord::Base
  attr_accessible :cylinders

  has_many :cars
end
