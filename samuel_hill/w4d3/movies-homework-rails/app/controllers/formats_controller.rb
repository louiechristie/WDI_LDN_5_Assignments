class FormatsController < ApplicationController

	load_and_authorize_resource

	def index
		@formats = Format.all
	end

	def new
		@format = Format.new
	end

	def create
		@format = Format.create(params[:format])
		redirect_to formats_path
	end

	def edit
		@format = Format.find(params[:id])
	end

	def update
		@format = Format.find(params[:id])
      	@format.update_attributes(params[:format])
      	redirect_to formats_path
	end

	def destroy
		@format = Format.find(params[:id])
	    @format.destroy
	    redirect_to formats_path
	end

end
