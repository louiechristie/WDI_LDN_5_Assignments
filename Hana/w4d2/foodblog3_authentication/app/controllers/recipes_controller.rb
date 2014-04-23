class RecipesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
    @ingredients = Ingredient.all 
    @recipe.ingredients_recipes.build
   
  end

  def create
    #params([:recipe][:ingredients_recipes])
    @ingredients = Ingredient.all 
    if @recipe.save
      redirect_to @recipe, notice: 'Your recipe has been added!'
      
    else
       render action: 'new'
    end
  end

  def edit
    @ingredients = Ingredient.all
  end

  def update
    @recipe.update_attributes(params[:recipe])
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @category = @recipe.category
    @recipe.destroy

    redirect_to(recipes_path)
  end

end