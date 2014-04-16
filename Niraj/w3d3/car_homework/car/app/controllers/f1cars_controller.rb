
class F1carsController < ApplicationController

  def index
    @cars = F1car.all 
  end

  def new
    @f1car = F1car.new
  end

  def create 
    @f1car = F1car.create(params[:f1car]) 
    # f1car_i_just_made
    redirect_to f1cars_path   
  end 

   def show
    @f1car  = F1car.find(params[:id])
   end

   def destroy
 
    @f1car = F1car.find(params[:id])
    @f1car.destroy   
    redirect_to f1cars_path
   end

  def edit
    @f1car = F1car.find(params[:id])
  end

  def update
    @f1car = F1car.find(params[:id])
    @f1car.update_attributes(params[:f1car])
    redirect_to f1cars_path   

  end


end
