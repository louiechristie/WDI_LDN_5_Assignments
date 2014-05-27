class Planet < ActiveRecord::Base
  attr_accessible :dist_from_sun, :moons, :name, :size
end
