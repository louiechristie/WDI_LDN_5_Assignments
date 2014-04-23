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
      redirect_to movies_path, notice: "Account creation successful"
    else
      render "new"
    end
  end

end
