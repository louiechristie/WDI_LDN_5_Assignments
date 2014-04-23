class Engine < ActiveRecord::Base
  attr_accessible :cylinders, :fuel_type, :power, :name

  has_many :cars, dependent: :destroy

  def engine_values
   "#{name} #{power} #{cylinders} #{fuel_type}"
  end


end
