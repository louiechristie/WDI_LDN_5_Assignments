class Car < ActiveRecord::Base
  attr_accessible :category, :colour, :engine_size, :image, :model, :make, :year
end
