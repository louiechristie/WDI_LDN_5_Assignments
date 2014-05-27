class Star < ActiveRecord::Base
  attr_accessible :classification, :luminosity, :mass, :name, :age
end
