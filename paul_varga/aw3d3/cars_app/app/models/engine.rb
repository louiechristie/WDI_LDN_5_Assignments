class Engine < ActiveRecord::Base
  attr_accessible :cylinders, :fuel_type, :power, :name

  has_many :cars, dependent: :destroy
end
