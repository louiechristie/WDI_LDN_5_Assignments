class UsersController < ApplicationController
  
  def index
    @users = User.all

  end

  def update
    
    @user = User.find(current_user)
    current_films = @user.movie_ids
 
    if params[:movieaction] == "add"
        current_films << params["movie_id"].to_i
    else 
        current_films.delete(params["movie_id"].to_i)
    end
        

    @user.movie_ids = current_films

    redirect_to user_path
  end

  def new
    @user = User.new

  end

  
  def create
    @user = User.new(params[:user])
    
      if @user.save
        redirect_to new_session_path
        # redirect_to 'sessions#create'
        
      else
         render action: "new" 
        
      end
  
  end

  def show
    @user = current_user
    @movies = @user.movie_ids.map{|id| Movie.find(id)}

  end


  
end
