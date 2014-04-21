class RecipesController < ApplicationController
 def index
      if params[:category] && params[:category][:id]
        @recipes = Recipe.where("category_id = '#{params[:category][:id]}'")
      else
        @recipes = Recipe.all
      end
  end

  def new
    @recipe = Recipe.new unless @recipe 
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.save
    @ingredients_recipes = params[:ingredients_recipes]
    @ingredients_recipes.each { |ingredient_id, quantity|
      IngredientsRecipe.create(recipe_id: @recipe.id, ingredient_id: ingredient_id, quantity: quantity)
      }
    if @recipe.save
      redirect_to(recipes_path)
    else 
      render 'new'
    end 
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @ingredients_recipes = @recipe.ingredients_recipes

  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update_attributes(params[:recipe])
    @recipe.save
    if @recipe.save
      redirect_to(recipes_path)
    else 
      @categories = Category.all
      render 'edit'
    end
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
    @ingredients_recipes = @recipe.ingredients_recipes
  end

end



