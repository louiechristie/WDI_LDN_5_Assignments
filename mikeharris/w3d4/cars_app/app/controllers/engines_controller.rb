class EnginesController < ApplicationController 
  
  def index
    @engines = Engine.all    
  end

  def new 
    @engines = Engine.all
  end

  def create
    Engine.create(params["engine"])
    redirect_to engines_path
  end

  def destroy 
    Engine.find_by_id(params["id"]).destroy
    redirect_to engines_path
  end

  def edit
    @car = Engine.find_by_id(params[:id])
  end

  def update
      Engine.find_by_id(params["id"]).update_attributes(params["engine"])
      redirect_to engines_path
  end

  def show

  end


end
