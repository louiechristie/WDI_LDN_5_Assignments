class EnginesController < ApplicationController
 
   def index
     @engines = Engine.all
   end
 
   def new
     @engine = Engine.new
   end
 
   def create
     Engine.create(params[:engine])
     redirect_to engines_path
   end
 
   def edit
     @engine = Engine.find(params[:id])
   end
   def update
     @engine = Engine.find(params[:id])
         @engine.update_attributes(params[:engine])
         redirect_to engines_path
   end
 
   def destroy
       @engine = Engine.find(params[:id])
       @engine.destroy
       redirect_to engines_path
   end
 
 end