class IngredientsController < ApplicationController
def new
  @ingredient = Ingredient.new
end

def create
  Ingredient.create(params[:ingredient])
  redirect_to(categories_path)
end
end