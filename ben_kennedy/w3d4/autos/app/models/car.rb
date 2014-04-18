class Car < ActiveRecord::Base
  attr_accessible :description, :make, :mileage, :model, :year, :engine_id

  belongs_to :engine

end
