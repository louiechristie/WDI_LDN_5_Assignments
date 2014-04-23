class Car < ActiveRecord::Base
  attr_accessible :category, :color, :make, :year


  belongs_to :engine
end
