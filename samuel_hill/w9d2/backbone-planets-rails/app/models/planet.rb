class Planet < ActiveRecord::Base
  attr_accessible :moons, :name, :mass
end
