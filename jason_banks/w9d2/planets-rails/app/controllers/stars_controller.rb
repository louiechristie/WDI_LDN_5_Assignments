class StarsController < ApplicationController

  respond_to :json

  def index
    @stars = Star.all
    respond_with @stars
  end
end
