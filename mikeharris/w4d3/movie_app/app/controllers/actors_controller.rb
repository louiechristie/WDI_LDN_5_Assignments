class ActorsController < ApplicationController
  
  def index 
    # @actors = Actor.all

      # @recipes = Recipe.all

    @q = Actor.search(params[:q])
    @actors = @q.result(distinct: true)

  end

  def show
    @actor = Actor.find(params[:id])
    @movie_ids = @actor.movie_ids
  end
end
