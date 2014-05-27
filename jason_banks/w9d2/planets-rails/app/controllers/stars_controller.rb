class StarsController < ApplicationController

  respond_to :json

  def index
    @stars = Star.all
    respond_with @stars
  end

  def create
    @star = Star.new params[:star]

    if @star.save
      respond_with @star, status: :accepted
    else
      respond_with @star, status: :unprocessable_entity
    end
  end

  def update
    @star = Star.find params[:id]

    if @star.update_attributes params[:star]
      respond_with @star, status: :accepted
    else
      respond_with @star, status: :unprocessable_entity
    end
  end
end
