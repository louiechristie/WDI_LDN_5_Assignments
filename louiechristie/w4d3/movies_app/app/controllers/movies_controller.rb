class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params[:movie])

    if @movie.save
      redirect_to @movie, notice: 'Category was successfully created.'
    else
      redirect_to new_movie_path, notice: 'Category was not created.'  
    end
  end

  def destroy
    Movie.find(params[:id]).destroy
    redirect_to(movies_path)
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(params[:movie])
    redirect_to @movie, notice: 'Movie was successfully updated.'
    else
      redirect_to(edit_movies_path)
    end
  end

end