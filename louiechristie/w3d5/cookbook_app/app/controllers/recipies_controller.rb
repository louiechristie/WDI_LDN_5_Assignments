class RecipiesController < ApplicationController

  def index
    @recipies = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
   Recipe.create(params["recipe"])
   redirect_to(recipies_path)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    Recipe.find(params[:id]).destroy
    redirect_to(recipies_path)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update_attributes(params[:recipe])
    redirect_to(recipies_path)
  end

end
