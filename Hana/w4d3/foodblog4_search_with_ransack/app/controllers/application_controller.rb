class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user 

  before_filter :setup_search_object

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "You don't have permission to do that!"
  end

  private
  def current_user
    begin
      @current_user ||= User.find_by_id(session[:current_user_id]) if session[:current_user_id]
    rescue ActiveRecord::RecordNotFound
      session.delete(:current_user_id)
      nil
    end
  end

  private
  def setup_search_object
    @q = Recipe.search(params[:q])
    @recipes = @q.result(distinct: true)
  end
 
end
