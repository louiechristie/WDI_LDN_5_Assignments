class Planet < ActiveRecord::Base
  attr_accessible :image, :mass, :moons, :name
end
