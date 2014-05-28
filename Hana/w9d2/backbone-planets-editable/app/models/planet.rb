class Planet < ActiveRecord::Base
  attr_accessible :diameter, :moons, :name, :temp, :url
end
