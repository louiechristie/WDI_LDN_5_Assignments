class MoviesController < ApplicationController

	load_and_authorize_resource

	def index
		@q = Movie.search(params[:q])
  		@movies = @q.result(distinct: true)
	end

	def new
		@movie = Movie.new
	end

	def create

		@movie = Movie.create(params[:movie])
		redirect_to movies_path

    end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
      	@movie.update_attributes(params[:movie])
      	redirect_to movies_path
	end

	def destroy
		@movie = Movie.find(params[:id])
	    @movie.destroy
	    redirect_to formats_path
	end

end