class CategoriesController < ApplicationController


def index
    @categories = Category.all
  end

def new
  @category = Category.new
end

  def create
    @category = Category.new(params[:category])
    #redirect_to(categories_path)

    respond_to do |format|
    if @category.save
      format.html { redirect_to @category, notice: 'Category was successfully created.' }
      format.json { render json: @category, status: :created, location: @category }
    else
      format.html { render action: "new" }
      format.json { render json: @category.errors, status: :unprocessable_entity }
    end
  end



  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to(categories_path)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    redirect_to(categories_path)
  end





end
