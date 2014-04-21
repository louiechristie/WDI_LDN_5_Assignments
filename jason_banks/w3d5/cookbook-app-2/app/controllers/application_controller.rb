class ApplicationController < ActionController::Base
  protect_from_forgery

  def flash_notice(model_name)
    flash[:notice] = "#{model_name} not saved due to incomplete information."
  end

end
