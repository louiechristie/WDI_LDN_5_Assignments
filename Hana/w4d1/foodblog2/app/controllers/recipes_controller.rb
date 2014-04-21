class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all 
   
  end

  def create
    #params([:recipe][:ingredients_recipes])
    @recipe = Recipe.create(params[:recipe])
    @ingredients = Ingredient.all 
    if @recipe.save
      redirect_to @recipe, notice: 'Your recipe has been added!'
      
    else
       render action: 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @ingredients = Ingredient.all
    @ingredientsrecipe = IngredientsRecipe.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    params[:recipe][:ingredient_ids] ||= []
    @recipe.update_attributes(params[:recipe])
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @category = @recipe.category
    @recipe.destroy

    redirect_to(recipes_path)
  end

end