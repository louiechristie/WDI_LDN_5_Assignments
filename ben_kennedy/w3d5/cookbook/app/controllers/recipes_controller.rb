class RecipesController < ApplicationController
 def index
      @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new unless @recipe 
    @categories = Category.all
  end

  def create
    @recipe = Recipe.create(params[:recipe])
    @ingredient = Ingredient.new
    @categories = Category.all
    redirect_to(new_ingredient_path)
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
    @recipe = Recipe.find(params[:id]) 
    @ingredients = Ingredient.where("recipe_id = '#{params[:id]}'")
    @ingredient = Ingredient.new
  end

end



