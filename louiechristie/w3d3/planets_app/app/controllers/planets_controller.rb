class PlanetsController < ApplicationController

  def index
    @planets = Planet.all
  end

  def create
   Planet.create(params["planet"])
   redirect_to(planets_path)
  end

  def show
    @planet = Planet.find(params[:id])
  end

  def destroy
    Planet.find(params[:id]).destroy
    redirect_to(planets_path)
  end

end