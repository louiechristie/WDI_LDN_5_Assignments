class Car < ActiveRecord::Base
  attr_accessible :name, :make, :year, :value, :description, :image, :engine_id

  belongs_to :engine
end

