class Engine < ActiveRecord::Base
  attr_accessible :cylinders, :fuel, :power

  has_many :cars, dependent: :destroy
  
end
