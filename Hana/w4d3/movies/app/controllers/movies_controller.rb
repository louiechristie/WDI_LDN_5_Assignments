class MoviesController < ApplicationController
# load_and_authorize_resource

def index
  @movies = Movie.all
end

def show
  @movie = Movie.find(params[:id])
end

def new
  @movie = Movie.new
end

def create
  Movie.create(params[:movie])
  redirect_to(root_path)
end

def edit
  @movie = Movie.find(params[:id])
end

def update
  @movie = Movie.find(params[:id])
  @movie.update_attributes(params[:movie])
    redirect_to movie_path(@movie)
end

def destroy
  @movie = Movie.find(params[:id])
  @movie.destroy
  redirect_to movies_path
end

end