class Planet < ActiveRecord::Base
  attr_accessible :mass, :moons, :name, :age, :image
end
