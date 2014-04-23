class Car < ActiveRecord::Base
  attr_accessible :colour, :image, :max_speed, :name, :engine_id

  belongs_to :engine

end
