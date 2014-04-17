class Engine < ActiveRecord::Base
  attr_accessible :cylinders, :fuel, :manufacturer

  has_many :vehicles

  def engine_values
    "#{manufacturer} #{cylinders}-cylinder, #{fuel}-powered"
  end
end
