class RecipesController < ApplicationController 

  def index
    @categories = Category.all
    @recipes = Recipe.all
  end

  
end
