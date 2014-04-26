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
      redirect_to(root_path, notice: "You have been successfully added and logged into disastronomia.")
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
    User.destroy(params[:id])
    if session[:current_user_id] = params[:id]
      session[:current_user_id] = nil
      redirect_to(root_url, notice: "You have been removed.")
    else
      redirect_to(users_path)
    end
  end

end
