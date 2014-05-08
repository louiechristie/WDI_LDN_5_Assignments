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
    params[:user][:role] = :member
    @user = User.new(params[:user])

    if @user.save
      @user = User.find_by_username(@user.username)
      session[:current_user_id] = @user.id
      redirect_to(user_path(@user), notice: "You have been successfully added and logged into disastronomia.")
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to(user_path(@user), notice: "#{@user.username} has been successfully updated.")
    else
      render action: 'edit'
    end
  end

  def destroy
    if session[:current_user_id] == params[:id].to_i
      User.destroy(params[:id])
      redirect_to(root_url, notice: "You have been removed.")
    else
      User.destroy(params[:id])
      redirect_to(users_path, notice: "User has been removed.")
    end
  end

end
