class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      @user = User.find_by_email(@user.email)
      session[:current_user_id] = @user.id
      redirect_to(root_path, notice: "You have been successfully added and logged into disastronomia.")
    else
      render :new
    end
  end

end
