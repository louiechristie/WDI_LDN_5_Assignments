class PlanetsController < ApplicationController

def index
  @planets = Planet.all
end

def create
  Planet.create(params[:planet])
  redirect_to(planets_path)
end

def show
  @planet = Planet.find(params[:id])
end

def destroy
  planet = Planet.find(params[:id])
  planet.destroy
  redirect_to(planets_path)
end


end