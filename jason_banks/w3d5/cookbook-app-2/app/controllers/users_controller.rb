class UsersController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource only: :show

  def index
  end

  def new
  end

  def show
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      @user = User.find_by_username(@user.username)
      session[:current_user_id] = @user.id
      redirect_to(root_path, notice: "You have been successfully added and logged into disastronomia.")
    else
      render :new
    end
  end

end
