class Planet < ActiveRecord::Base
  attr_accessible :mass, :moons, :name
end
