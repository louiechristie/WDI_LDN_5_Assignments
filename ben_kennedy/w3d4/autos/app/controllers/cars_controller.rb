class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
    @engines = Engine.all
  end

  def create
    @car = Car.create(params[:car])
    @car.save

    redirect_to(cars_path)
  end

  def edit
    @car = Car.find(params[:id])
    @engines = Engine.all
  end

  def update
    @car = Car.find(params[:id])
    @car.update_attributes(params[:car])
    @car.save
    redirect_to(cars_path)

  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to(cars_path)    
  end

  def engine
    @car_id = Car.find(params[:id])
    @engine = Engine.find(@car_id.engine_id)
    @cars = Car.all
    render 'index'
  end


end
