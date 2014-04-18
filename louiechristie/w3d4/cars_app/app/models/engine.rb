class Engine < ActiveRecord::Base
  attr_accessible :cylinders, :fuel, :power

  has_many :cars, dependent: :destroy


  def engine_values

    "#{power}, #{cylinders}, #{fuel}"

  end
  
end
