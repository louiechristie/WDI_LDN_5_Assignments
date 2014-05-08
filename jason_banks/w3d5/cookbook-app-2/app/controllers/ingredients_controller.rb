class IngredientsController < ApplicationController
  load_and_authorize_resource

  before_filter :search_form

  def index
  end

  def new
  end

  def create
    params[:ingredient][:name].downcase!
    @ingredient = Ingredient.new(params[:ingredient])
    if @ingredient.save
      redirect_to(@ingredient, notice: "#{@ingredient.name} has been successfully added.")
    else
      render action: 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    find_ingredient
    params[:ingredient][:name].downcase!
    if @ingredient.update_attributes(params[:ingredient])
      redirect_to(@ingredient, notice: "#{@ingredient.name} has been successfully updated.")
    else
      render action: 'edit'
    end
  end

  def destroy
    Ingredient.destroy(params[:id])
    redirect_to(ingredients_path)
  end

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def search_form
    @q = Category.search(params[:q])
    @categories = @q.result
    @model_name = "category"
  end


  
end
