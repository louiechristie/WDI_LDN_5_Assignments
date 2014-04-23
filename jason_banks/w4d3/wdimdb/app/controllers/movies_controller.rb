class MoviesController < ApplicationController

  def index
    @q = Movie.search(params[:q])
    @movies = @q.result(distinct: true)
  end

  def new
    @movie = Movie.new
  end

  def search_omdb

    if params[:title] == ""
      redirect_to new_movie_path, notice: "Your search did not return a movie. Please check the title and try again."
    else
      @url_title = params[:title].tr(" ", "+")
      url = "http://www.omdbapi.com/?t=#{@url_title}"
      html = HTTParty.get(url)
      @hash = JSON(html)      
    end

    if @hash && @hash['Response'] == "False"
      redirect_to new_movie_path, notice: "Your search did not return a movie. Please check the title and try again."
    else
      @movie = Movie.new
      @movie.title = @hash['Title']
      @movie.director = @hash['Director']
      @movie.actors = @hash['Actors']
      @movie.plot = @hash['Plot']
      @movie.image = @hash['Poster']
      
      render 'new'
    end
  end

  def create
    
    @movie = Movie.new(params[:movie])

    if @movie.save
      redirect_to movie_path(@movie), notice: "Successfully added to the WDImdb."
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
