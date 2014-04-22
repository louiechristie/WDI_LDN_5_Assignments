class CategoriesController < ApplicationController
  load_and_authorize_resource
  def index
      @categories = Category.all
  end

  def new
    @category = Category.new
    # @engines = Engine.all
  end

  def create
    @category = Category.create(params[:category])
    @category.save

    redirect_to(categories_path)
  end

  def edit
    @category = Category.find(params[:id])
    # @engines = Engine.all
  end

def update
  @category = Category.find(params[:id])
  @category.update_attributes(params[:category])
  @category.save
  redirect_to(categories_path)

end

def destroy
  @category = Category.find(params[:id])
  @category.destroy
  redirect_to(categories_path)    
end

# def engine
#   @category_id = Category.find(params[:id])
#   @engine = Engine.find(@category_id.engine_id)
#   @categories = Category.all
#   render 'index'
# end

end
