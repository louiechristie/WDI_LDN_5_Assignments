class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  before_filter :setup_search_object

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: "You dont have permission to do that"
  end

  private

  def setup_search_object
    @q = Recipe.search(params[:q])
  end

  private
  def current_user
    begin
   @current_user ||= User.find_by_id(session[:current_user_id]) if session[:current_user_id]

    rescue
          session.delete(:current_user_id)

    end 
  end
end