class RecipesController < ApplicationController
 def index
      @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @categories = Category.all
  end

  def create
    raise 'check params'
    @recipe = Recipe.create(params[:recipe])
    @recipe.save

    redirect_to(recipes_path)
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @categories = Category.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update_attributes(params[:recipe])
    @recipe.save
    redirect_to(recipes_path)

  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to(recipes_path)    
  end

  def full_recipe
    raise 'full recipe'
  end

  def show
    @recipe = Recipe.new unless @recipe 
    @ingredients = Ingredient.new
    @categories = Category.all

  end

end

