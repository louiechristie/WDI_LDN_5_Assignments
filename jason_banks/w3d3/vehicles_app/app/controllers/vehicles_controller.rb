class VehiclesController < ApplicationController

  def new
    @vehicle = Vehicle.new
    @type_of_vehicle_array = ['Airplane', 'Jet', 'Helicopter', 'Jeep', 'Truck', 'Car', 'Train', 'Coach (motor)', 'Coach (non-motor)', 'Tank/heavily-armored vehicle']
  end

  def create
    @vehicle = Vehicle.create(params[:vehicle])
    @vehicle.inspect
    redirect_to(vehicle_path(@vehicle))
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end














end