class MoviesController < ApplicationController

  def index
  end

  def new
    @movie = Movie.new
  end

  def search_omdb
    @title = params[:title]

    if @title && @title > ""
      @url_title = @title.tr(" ", "+")
      url = "http://www.omdbapi.com/?t=#{@url_title}"
      html = HTTParty.get(url)
      @hash = JSON(html)
      @movie = Movie.new
      @movie.title = @hash['Title']
      @movie.review = @hash['Plot']
      render 'new'
    else
      render 'new', notice: "You search did not return a movie. Please check the title and try again."
    end
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
