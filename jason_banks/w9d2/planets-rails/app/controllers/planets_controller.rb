class PlanetsController < ApplicationController

  respond_to :json

  def index
    @planets = Planet.all
    respond_with @planets
  end
end
