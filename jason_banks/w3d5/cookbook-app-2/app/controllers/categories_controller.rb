class CategoriesController < ApplicationController
  load_and_authorize_resource

  before_filter :search_form

  def home
  end

  def attribution
  end

  def index
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to(categories_path, notice: "#{@category.name} has been successfully added.")
    else
      render action: 'new'
    end

  end

  def show
    find_category
    find_recipes
  end

  def edit
    find_category
  end

  def update
    find_category
    if @category.update_attributes(params[:category])
      redirect_to(categories_path, notice: "#{@category.name} has been successfully updated.")
    else
      render action: 'edit'
    end
  end

  def destroy
    Category.destroy(params[:id])
    redirect_to(categories_path)
  end

  def find_category
    @category = Category.find(params[:id])
  end

  def find_recipes
    @recipes = Recipe.where(id: @category.recipe_ids)
  end

  def search_form
    @q = Category.search(params[:q])
    @categories = @q.result
    @model_name = "category"
  end


end
