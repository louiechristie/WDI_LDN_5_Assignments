class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :setup_search_object

  helper_method :current_user

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, notice: "You are not authorized to view this page."
  end

  private
  def setup_search_object
    @q = nil
  end

  private
  def current_user
    begin
      @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
    rescue ActiveRecord::RecordNotFound
      session.delete(:current_user_id)
      nil
    end
  end

end
