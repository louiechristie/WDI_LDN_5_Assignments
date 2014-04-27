class MoviesController < ApplicationController
  load_and_authorize_resource

  def index
    @movies = Movie.all

  end
    
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params[:movie])
    @movie.user_id = session[:user_id]
    @movie.omdb_pull
    @movie.save
      if @movie.save
        redirect_to movies_path, notice: "'#{@movie.name}' added to the database!"
      else
        render 'new'
      end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update_attributes(params[:movie])
    @movie.omdb_pull
    @movie.save
    if @movie.update_attributes(params[:movie])
      redirect_to movies_path, notice: "'#{@movie.name}' updated!"
    else
      render 'edit'
    end

  end

  def show 
    @movie = Movie.find(params[:id])
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path, notice: "'#{@movie.name}' removed from the database!"
  end

end
