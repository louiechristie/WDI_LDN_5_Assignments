class CarsController < ApplicationController
  
  @debug = false

  def index
    @cars = Car.all
  end
end
