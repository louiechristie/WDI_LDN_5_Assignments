class StarsController < ApplicationController

  respond_to :json

  def index
    @stars = Star.all
    respond_with @stars
  end

  def create
    @planet = Planet.new params[:planet]

    if @planet.save
      respond_with @planet, status: :accepted
    else
      respond_with @planet, status: :unprocessable_entity
    end
  end

  def update
    @planet = Planet.find params[:id]

    if @planet.update_attributes params[:planet]
      respond_with @planet, status: :accepted
    else
      respond_with @planet, status: :unprocessable_entity
    end
  end
end
