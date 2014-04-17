class EnginesController < ApplicationController

@debug = false

  def index
    @engines = Engine.all
  end

  def show
    @engine = Engine.find(params[:id])
  end

  def edit
    @engine = Engine.find(params[:id])
  end

  def update
    @engine = Engine.find(params[:id])
    @engine.update_attributes(params[:engine])
    redirect_to(engines_path)  
  end

  def create
   Engine.create(params["engine"])
   redirect_to(engines_path)
  end

  def destroy
    Engine.find(params[:id]).destroy
    redirect_to(engines_path)
  end

end
