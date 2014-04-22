class RecipesController < ApplicationController
load_and_authorize_resource

def index
  @recipes = Recipe.all
end

def new
  @recipe = Recipe.new 
end

def create
  @recipe = Recipe.new(params[:recipe])
  #redirect_to(recipes_path)

  respond_to do |format|
    if @recipe.save
      format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
      format.json { render json: @recipe, status: :created, location: @recipe }
    else
      format.html { render action: "new" }
      format.json { render json: @recipe.errors, status: :unprocessable_entity }
    end
  end

end

def show
  @recipe = Recipe.find(params[:id])
end

def destroy
  Recipe.find(params[:id]).destroy
  redirect_to(recipes_path)
end

def edit
  @recipe = Recipe.find(params[:id])
end

def update
  @recipe = Recipe.find(params[:id])
  @recipe.update_attributes(params[:recipe])
  redirect_to(recipes_path)
end








end
