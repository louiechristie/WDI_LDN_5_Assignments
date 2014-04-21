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
    to_add = params["recipe"]
    to_add["ingredient_ids"] = params["ingredient_ids"]
    @recipe = Recipe.find_by_id(params["id"])
    @recipe.update_attributes(to_add)
   
    @ingredients = Ingredient.all
    
      if @recipe.errors.nil?

        redirect_to recipes_path        
        

      else
        
        render action: "edit" 
      end
   
  end

  def create
    @recipe = Recipe.create(params["recipe"])
    @recipe.ingredient_ids = params["ingredient_ids"]
    @ingredients = Ingredient.all
      if @recipe.save
        redirect_to recipes_path
      else
        render action: "new" 

      end
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

