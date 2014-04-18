class CarsController < ApplicationController 
  
  def index
    @cars = Car.all
  end

  def new 
    @engines = Engine.all
  end

  def create
    Car.create(params["car"])
    redirect_to cars_path
  end

  def delete
    Car.find_by_id(params["id"]).destroy
    redirect_to cars_path
  end

  def edit
    @car = Car.find_by_id(params[:id])
    render 'edit'
  end

  def update
      Car.find_by_id(params["id"]).update_attributes(params["car"])
      redirect_to cars_path
  end

  def show
    @car = Car.find_by_id(params["id"])
    @engine = @car.engine 
  end


end
