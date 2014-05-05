class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      flash[:notice] = 'Logged in successfully'
      redirect_to root_url, notice: 'Logged in successfully'
    else
      flash.now.alert = "Invalid email or password"
      render 'new'
    end

  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_url, notice: 'You are now logged out.'
  end
end
