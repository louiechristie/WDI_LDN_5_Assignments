class CarsController < ApplicationController
  
  @debug = false

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def destroy
    Car.find(params[:id]).destroy
    redirect_to(cars_path)
  end

end
