class Vehicle < ActiveRecord::Base
  attr_accessible :country, :make, :model, :type_of_vehicle, :engine_id

  belongs_to :engine
end
