class RecipesController < ApplicationController 

  def index
    @categories = Category.all
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  def edit 
    @recipe = Recipe.find_by_id(params[:id])
  end

  def update
    Recipe.find_by_id(params["id"]).update_attributes(params["recipe"])
    redirect_to recipes_path
  end

  def create
    Recipe.create(params["recipe"])
    redirect_to recipes_path
  end

  def new
    @recipe = Recipe.new
  end

  def destroy
    Recipe.find_by_id(params[:id]).destroy
    redirect_to recipes_path
  end

end

