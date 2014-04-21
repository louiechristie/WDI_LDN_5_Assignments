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
    @ingredients = Ingredient.all
  end

  def update
    
    Recipe.find_by_id(params["id"]).update_attributes(params["recipe"])
    Recipe.find_by_id(params["id"]).ingredient_ids = params["ingredient_ids"]

    redirect_to recipes_path
  end

  def create
    a = Recipe.create(params["recipe"])
    a.ingredient_ids = params["ingredient_ids"]
    redirect_to recipes_path
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def destroy
    Recipe.find_by_id(params[:id]).destroy
    redirect_to recipes_path
  end

end

