class RecipesController < ApplicationController
 def index
      @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new unless @recipe 
    @ingredients = Ingredient.new
    @categories = Category.all
  end

  def create
    raise 'check'
    @recipe = Recipe.new(params[:recipe])
    if params[:temp_ingredients]
      @temp_ingredients = [ params[:temp_ingredients] ]
      else
      @temp_ingredients = [ ]
    end
    @ingredient = Ingredient.new(params[:ingredient])
    @temp_ingredients.push(name: @ingredient.name, quantity: @ingredient.quantity, unit: @ingredient.unit)
    @ingredients = Ingredient.new
    @categories = Category.all
    render 'new'
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
    @recipe = Recipe.create(params[:recipe])
    @recipe.save

  end

  def show
    raise 'show path'

  end

end

