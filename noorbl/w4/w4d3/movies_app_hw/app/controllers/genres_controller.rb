class GenresController < ApplicationController
  


 
  def index
    @genres = Genre.all
  end

  

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(params[:genre])
    if @genre.save
      redirect_to genres_path, :notice => "Successfully added genre #{@genre.name}."
    else
      render :action => 'new'
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update_attributes(params[:genre])
      redirect_to genres_path, :notice => "Successfully updated #{@genre.name}."
    else
      render :action => 'edit'
    end
  end

  

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to genre_url, :notice => "Succesfully destroyed genre."
  end

  

  
end
