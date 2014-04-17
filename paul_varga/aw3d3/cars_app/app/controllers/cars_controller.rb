class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def new
    @car = Car.create
  end

  def create
    @car = Car.create(params[:cars])
    redirect_to(cars_path)
  end

  def show
    @car = Car.find(params[:id])
    @engine = @car.engine

    render 'show'
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to(cars_path)
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update_attributes(params[:cars])

    redirect_to cars_path
  end


end

