class RecipesController < ApplicationController
 load_and_authorize_resource
 def index
      if params[:category] && params[:category][:id]
        @recipes = Category.find(params[:category][:id]).recipes
      elsif params[:ingredient] && params[:ingredient][:id]
        @recipes = Ingredient.find(params[:ingredient][:id]).recipes
      else
        @recipes = Recipe.all
      end
  end

  def new
    @recipe = Recipe.new unless @recipe 
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.user_id = session[:user_id]
    @recipe.save
    @ingredients_recipes = params[:ingredients_recipe]
    @ingredients_recipes.each { |ingredient_id, quantity|
      IngredientsRecipe.create(recipe_id: @recipe.id, ingredient_id: ingredient_id.to_i, quantity: quantity)
      }
    if @recipe.save
      redirect_to(recipes_path)
    else 
      render 'new'
    end 
  end

  def edit
    @recipe = Recipe.find(params[:id])
   end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update_attributes(params[:recipe])
    @recipe.save
    @ingredients_recipes_to_update = @recipe.ingredients_recipes
    params[:ingredients_recipes].each { |ingred_id, quantity_update|
      update = @ingredients_recipes_to_update.select { |ingredients_recipe| ingredients_recipe.ingredient_id == ingred_id.to_i }
      update[0].quantity = quantity_update
      update[0].save
    }
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



