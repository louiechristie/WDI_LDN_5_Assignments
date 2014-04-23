class CarsController < ApplicationController
  
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def edit
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def update
    @car = Car.find(params[:id])
    @car.update_attributes(params[:car])
    redirect_to(cars_path)  
  end

  def create
   Car.create(params["car"])
   redirect_to(cars_path)
  end

  def destroy
    Car.find(params[:id]).destroy
    redirect_to(cars_path)
  end

end
