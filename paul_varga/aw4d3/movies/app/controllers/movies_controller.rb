class MoviesController < ApplicationController
  load_and_authorize_resource

  def index
    @movies = @q.result(distinct: true)

    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create 
    @movie = Movie.new(params[:movie])

    respond_to do |format|
      if @movie.save

        if @movie.name && @movie.name > ""
        @name = @movie.name

        @url_name = @name.downcase.tr(" ", "+")

        url = "http://www.omdbapi.com/?t=#{@url_name}"
        html = HTTParty.get(url)
        @hash = JSON(html)

        @movie.review  = @hash['Plot']
        @movie.year = @hash['Year']

        @movie.save
        end

        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
      else
        format.html { render action: 'new'}
      end
    end

  end

  def show
    @movie = find_movie
  end

  def destroy
    @movie = find_movie
    @movie.destroy
    redirect_to(movies_path)
  end

  def edit
    @movie = find_movie
  end

  def update
    @movie = find_movie

    respond_to do |format|
      if @movie.update_attributes(params[:movie])

      if @movie.name && @movie.name > ""
        @name = @movie.name

        @url_name = @name.downcase.tr(" ", "+")

        url = "http://www.omdbapi.com/?t=#{@url_name}"
        html = HTTParty.get(url)
        @hash = JSON(html)

        @movie.review  = @hash['Plot']
        @movie.year = @hash['Year']

        @movie.save
      end
      
      format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
      else
      format.html { render action: "edit" }
      end
    end
  end

  private
  def find_movie
    Movie.find(params[:id])
  end


end