class HomeController < ApplicationController

def index
  @categories = Category.all
  @recipes = Recipe.all
  @ingredients = Ingredient.all
end

end