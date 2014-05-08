class ClassGamesController < ApplicationController
  # GET /class_games
  # GET /class_games.json
  def index
    @class_games = ClassGame.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @class_games }
    end
  end

  # GET /class_games/1
  # GET /class_games/1.json
  def show
    @class_game = ClassGame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @class_game }
    end
  end

  # GET /class_games/new
  # GET /class_games/new.json
  def new
    @class_game = ClassGame.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @class_game }
    end
  end

  # GET /class_games/1/edit
  def edit
    @class_game = ClassGame.find(params[:id])
  end

  # POST /class_games
  # POST /class_games.json
  def create
    @class_game = ClassGame.new(params[:class_game])

    respond_to do |format|
      if @class_game.save
        format.html { redirect_to @class_game, notice: 'Class game was successfully created.' }
        format.json { render json: @class_game, status: :created, location: @class_game }
      else
        format.html { render action: "new" }
        format.json { render json: @class_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /class_games/1
  # PUT /class_games/1.json
  def update
    @class_game = ClassGame.find(params[:id])

    respond_to do |format|
      if @class_game.update_attributes(params[:class_game])
        format.html { redirect_to @class_game, notice: 'Class game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @class_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /class_games/1
  # DELETE /class_games/1.json
  def destroy
    @class_game = ClassGame.find(params[:id])
    @class_game.destroy

    respond_to do |format|
      format.html { redirect_to class_games_url }
      format.json { head :no_content }
    end
  end
end
