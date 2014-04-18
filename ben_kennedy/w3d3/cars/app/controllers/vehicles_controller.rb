class VehiclesController < ApplicationController

def index

@vehicles = Vehicle.all
@engines = Vehicle.all

end

def new
  @vehicle = Vehicle.new
end

def create
  Vehicle.create(params[:vehicle])

  redirect_to(vehicles_path)
end

def edit
  @vehicle = Vehicle.find(params[:id])
  @engines = Engine.pluck(:id) 
end

def show
  vehicle = Vehicle.find(params[:id])
  @test ="Route has gone via Update"
  redirect_to(vehicles_path)
end


def update
  vehicle = Vehicle.find(params[:id])
  # @update_attributes = params[:vehicle]
  # @update_attributes[:vehicle:]
  vehicle.update_attributes(params[:vehicle])
  redirect_to(vehicles_path)
end

def destroy
  @vehicle = Vehicle.find(params[:id])
  @vehicle.destroy
  redirect_to(vehicles_path)
end




end
