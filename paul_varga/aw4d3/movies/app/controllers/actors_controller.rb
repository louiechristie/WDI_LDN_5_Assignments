class ActorsController < ApplicationController
  load_and_authorize_resource

  def index
    @actors = Actor.all
  end

  def new
    @actor = Actor.new
  end

  def create 
    @actor = Actor.new(params[:actor])

    respond_to do |format|
      if @actor.save
        format.html { redirect_to @actor, notice: 'Actor was successfully created.' }
      else
        format.html { render action: 'new'}
      end
    end
  end

  def show
    @actor = find_actor
  end

  def destroy
    @actor = find_actor
    @actor.destroy
    redirect_to(actors_path)
  end

  def edit
    @actor = find_actor
  end

  def update
    @actor = find_actor

    respond_to do |format|
      if @actor.update_attributes(params[:actor])
      format.html { redirect_to @actor, notice: 'Actor was successfully updated.' }
      else
      format.html { render action: "edit" }
      end
    end
  end

  private
  def find_actor
    Actor.find(params[:id])
  end


end