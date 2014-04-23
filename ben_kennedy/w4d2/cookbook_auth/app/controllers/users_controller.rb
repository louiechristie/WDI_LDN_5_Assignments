class UsersController < ApplicationController
  load_and_authorize_resource
  def index
  @users = User.all

  end

  def new
  @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.save
    if @user.save
      redirect_to recipes_path, notice: "New user created"
    else
      render 'new'
    end
  end


end
