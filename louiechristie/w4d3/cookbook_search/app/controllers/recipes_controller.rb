class RecipesController < ApplicationController

  load_and_authorize_resource

  def index
  end

  def new
    @recipe = Recipe.new
  end

  def create
   Recipe.create(params["recipe"])
   redirect_to(recipes_path)
  end

  def show
    @recipe = Recipe.find(params[:id])

    @sentences = []

    @recipe.ingredients_recipes.map do |ingredients_recipe |

      quantity = ingredients_recipe.quantity.to_s || "some amount"
      measure = ingredients_recipe.measure|| "A measure"
      name = Ingredient.find(ingredients_recipe.ingredient_id).name || ""
      sentence = quantity+" "+measure+" "+name
      @sentences << sentence
    end
  end

  def destroy
    Recipe.find(params[:id]).destroy
    redirect_to(recipes_path)
  end

  def edit
    @recipe = Recipe.find(params[:id])

    authorize! :edit, @recipe

  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update_attributes(params[:recipe])
    redirect_to(recipes_path)
  end

end
