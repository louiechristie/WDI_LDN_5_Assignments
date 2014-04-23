class MoviesController < ApplicationController

  def index
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params[:movie])

    if @movie.save
      redirect_to movie_path(@movie), notice: '"#{@movie.title}" has been added to the WDImdb.'
    else
      render 'new'
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
