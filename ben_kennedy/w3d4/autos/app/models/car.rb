class Car < ActiveRecord::Base
  attr_accessible :description, :make, :mileage, :model, :year

  belongs_to :engine

end
