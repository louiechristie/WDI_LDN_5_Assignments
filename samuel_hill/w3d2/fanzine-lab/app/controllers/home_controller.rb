class HomeController < ApplicationController
  protect_from_forgery

	def home
		render 'index'
	end

	def tour
		render 'tour'
	end

	def videos
		render 'videos'
	end

	def bio
		render 'bio'
	end

	def band
		render 'band'
	end

end