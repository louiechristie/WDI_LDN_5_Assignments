class VehiclesController < ApplicationController

  def index
    @vehicles = Vehicle.order('country')

  end

  def new
    @vehicle = Vehicle.new
    type_of_vehicle_array
  end

  def create
    @vehicle = Vehicle.create(params[:vehicle])

    redirect_to(vehicle_path(@vehicle))
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
    type_of_vehicle_array
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    @vehicle.update_attributes(params[:vehicle])
    flash: {notice: "Vehicle has been updated."}
    redirect_to(vehicle_path(@vehicle)) 
  end

  def destroy

    Vehicle.destroy(params[:id])

    redirect_to(vehicles_path)

  end

  def type_of_vehicle_array

    @type_of_vehicle_array = ['Airplane', 'Jet', 'Helicopter', 'Jeep', 'Truck', 'Car', 'Train', 'Coach (motor)', 'Coach (non-motor)', 'Tank/heavily-armored vehicle']

    @type_of_vehicle_array

  end
















end