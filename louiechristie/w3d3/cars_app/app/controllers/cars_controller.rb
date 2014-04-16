class CarsController < ApplicationController
  
  @debug = false

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

end
