class StarsController < ApplicationController
  def index
    @stars = Star.all
    respond_with @stars
  end

  def create
    @star = Star.new params[:star]
    if @star.save
      respond_with @star, status: :accepted
    else
      respond_with @star,
      status: :unprocessable_entity
    end
  end
end
