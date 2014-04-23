class UsersController < ApplicationController
 
  def index
    @users = User.all

    
  end



  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new


  end

 
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        redirect_to sessions_path, notice: 'User was successfully created.' 
       
      else
        render action: "new" 
        
      end
    end
  end

  
end
