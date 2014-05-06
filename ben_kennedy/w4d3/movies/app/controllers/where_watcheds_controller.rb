class WhereWatchedsController < ApplicationController
    load_and_authorize_resource
def index
    @where_watcheds = WhereWatched.all

  end
    
  def new
    @where_watched = WhereWatched.new
  end

  def create
    @where_watched = WhereWatched.new(params[:where_watched])
    @where_watched.save
      if @where_watched.save
        redirect_to where_watcheds_path, notice: "'#{@where_watched.location}' added to the database!"
      else
        render 'new'
      end
  end

  def edit
    @where_watched = WhereWatched.find(params[:id])
  end

  def update
    @where_watched = WhereWatched.find(params[:id])
    @where_watched.update_attributes(params[:where_watched])
    if @where_watched.update_attributes(params[:where_watched])
      redirect_to where_watcheds_path, notice: "'#{@where_watched.location}' updated!"
    else
      render 'edit'
    end

  end

  def show 
    @where_watched = WhereWatched.find(params[:id])
  end

  def destroy
    @where_watched = WhereWatched.find(params[:id])
    @where_watched.destroy
    redirect_to where_watcheds_path, notice: "'#{@where_watched.location}' removed from the database!"
  end
end
