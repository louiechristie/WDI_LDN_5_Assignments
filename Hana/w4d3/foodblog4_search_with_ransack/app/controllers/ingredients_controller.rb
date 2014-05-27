class IngredientsController < ApplicationController
load_and_authorize_resource


def index
  @ingredients = Ingredient.all
end

def show
  @ingredient = Ingredient.find(params[:id])
  
end

def new
  @ingredient = Ingredient.new
end

def create
  @ingredient = Ingredient.create(params[:ingredient])

  if @ingredient.save
    redirect_to(root_path)
  else
    render action: 'new'
  end
end
end