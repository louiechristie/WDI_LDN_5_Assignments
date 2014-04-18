class Car < ActiveRecord::Base
  attr_accessible :color, :make, :model, :engine_id

  belongs_to :engine

end
