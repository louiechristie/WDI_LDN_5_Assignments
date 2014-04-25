class CategoriesController < ApplicationController
 
  def index
    @categories = Category.all
  end

  

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to categories_path, :notice => "Successfully added category #{@category.name}."
    else
      render :action => 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to categories_path, :notice => "Successfully updated #{@category.name}."
    else
      render :action => 'edit'
    end
  end

  

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url, :notice => "Succesfully destroyed category."
  end

  

  
end
