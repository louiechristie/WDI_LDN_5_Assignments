class VehiclesController < ApplicationController

  def index
    @vehicles = Vehicle.order('make')

  end

  def new
    @vehicle = Vehicle.new
    type_of_vehicle_array
    #engine_types

  end

  def create
    @vehicle = Vehicle.create(params[:vehicle])

    redirect_to(vehicle_path(@vehicle))
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
    type_of_vehicle_array
    #engines
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    @vehicle.update_attributes(params[:vehicle])
    redirect_to(vehicle_path(@vehicle)) 
  end

  def destroy

    Vehicle.destroy(params[:id])

    redirect_to(vehicles_path)

  end

  def type_of_vehicle_array

    @type_of_vehicle_array = Vehicle.pluck(:type_of_vehicle).uniq

    @type_of_vehicle_array

  end

  def game
    @countries = Vehicle.pluck(:country).uniq
    @random_country = @countries.sample
    @vehicles = Vehicle.where("country = '#{@random_country}'")

    if params[:vehicle]
      @answer_country = params[:country].keys[0]
      @guess_country = params[:vehicle][:country]
      if @answer_country == @guess_country
        flash[:notice] = "Excellent! You've got a bright future in transport diplomacy.  Play again?"
        redirect_to('/')
      else
        flash[:notice] = "How dare you insult the great land of #{@answer_country}?! You should get some practice in.  Play again?"
        redirect_to('/')
      end
    end 
  end

  def engine_types
    @engines = Engine.all.to_a
    @engines
  end















end