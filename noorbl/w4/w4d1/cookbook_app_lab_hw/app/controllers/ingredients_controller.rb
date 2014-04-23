class IngredientsController < ApplicationController


def index
    @ingredients = Ingredient.all
  end

def new
  @ingredient = Ingredient.new
end

  def create
    @ingredient = Ingredient.new(params[:ingredient])
    #redirect_to(categories_path)

    respond_to do |format|
    if @ingredient.save
      format.html { redirect_to @ingredient, notice: 'Ingredient was successfully created.' }
      format.json { render json: @ingredient, status: :created, location: @ingredient }
    else
      format.html { render action: "new" }
      format.json { render json: @ingredient.errors, status: :unprocessable_entity }
    end
  end



  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def destroy
    Ingredient.find(params[:id]).destroy
    redirect_to(ingredients_path)
  end

  def edit
    @ingredient = Category.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @category.update_attributes(params[:ingredient])
    redirect_to(ingredients_path)
  end





end
