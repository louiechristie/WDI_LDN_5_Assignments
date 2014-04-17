class Car < ActiveRecord::Base
  attr_accessible :building, :color, :description, :image, :name, :year

  belongs_to :engine
end
