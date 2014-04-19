class ApplicationController < ActionController::Base
  protect_from_forgery

  def flash_notice
    flash[:notice] = "#{Ingredient} not saved due to incomplete information."
  end

end
