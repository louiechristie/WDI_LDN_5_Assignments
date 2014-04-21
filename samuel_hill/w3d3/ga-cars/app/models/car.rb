class Car < ActiveRecord::Base

  attr_accessible :category, :colour, :image, :model, :make, :year, :engine_id

  belongs_to :engine

end
