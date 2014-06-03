class ApplicationController < ActionController::Base
  protect_from_forgery


helper_method :hana_helper
  
  private
  def hana_helper
    "hana is helping"
  end

end
