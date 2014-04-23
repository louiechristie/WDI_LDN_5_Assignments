class UsersController < ApplicationController
 
  def index
    @users = User.all

    
  end



  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

 
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        redirect_to @user, notice: 'User was successfully created.' 
       
      else
        render action: "new" 
        
      end
    end
  end

  
end
