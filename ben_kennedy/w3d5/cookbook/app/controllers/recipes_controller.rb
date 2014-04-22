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
    @categories = Category.all
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.save
    @ingredient = Ingredient.new
    @categories = Category.all
    if @recipe.save
      redirect_to(new_ingredient_path)
    else 
      render 'new'
    end 
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @categories = Category.all
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
    @ingredients = Ingredient.where("recipe_id = '#{params[:id]}'")
    @ingredient = Ingredient.new
  end

end



