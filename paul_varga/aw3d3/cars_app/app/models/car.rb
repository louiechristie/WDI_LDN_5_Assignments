class Car < ActiveRecord::Base
  attr_accessible :building, :color, :description, :image, :name, :year, :engine_id

  belongs_to :engine
end
