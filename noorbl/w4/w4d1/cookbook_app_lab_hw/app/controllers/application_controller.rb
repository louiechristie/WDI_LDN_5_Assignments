class ApplicationController < ActionController::Base
  protect_from_forgery


  helper_method :current_user


rescue_from CanCan::AccessDenied do ||
  redirect_to root_path, alert: "Access denied"
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
