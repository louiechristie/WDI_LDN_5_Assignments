class Car < ActiveRecord::Base
  attr_accessible :description, :image, :make, :model, :value, :year
end
