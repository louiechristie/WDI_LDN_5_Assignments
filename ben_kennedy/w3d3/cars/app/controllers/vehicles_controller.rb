class VehiclesController < ApplicationController

def index

@vehicles = Vehicle.all

end

def new
  @vehicle = Vehicle.new
end

def create
  raise params.inspect
  Vehicle.create(params[:vehicle])

  redirect_to(vehicles_path)
end

def edit
  @vehicle = Vehicle.find(params[:id])

end

def show
  vehicle = Vehicle.find(params[:id])
  @test ="Route has gone via Update"
  redirect_to(vehicles_path)
end


def update
  vehicle = Vehicle.find(params[:id])
  vehicle.update_attributes(params[:vehicle])
  redirect_to(vehicles_path)
end

def destroy
  @vehicle = Vehicle.find(params[:id])
  @vehicle.destroy
  redirect_to(vehicles_path)
end




end
