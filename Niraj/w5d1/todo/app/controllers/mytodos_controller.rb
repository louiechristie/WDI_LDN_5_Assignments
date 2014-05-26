class MytodosController < ApplicationController
  # GET /mytodos
  # GET /mytodos.json
  def index
    @mytodos = Mytodo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mytodos }
    end
  end

  # GET /mytodos/1
  # GET /mytodos/1.json
  def show
    @mytodo = Mytodo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mytodo }
    end
  end

  # GET /mytodos/new
  # GET /mytodos/new.json
  def new
    @mytodo = Mytodo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mytodo }
    end
  end

  # GET /mytodos/1/edit
  def edit
    @mytodo = Mytodo.find(params[:id])
  end

  # POST /mytodos
  # POST /mytodos.json
  def create
    @mytodo = Mytodo.new(params[:mytodo])

    respond_to do |format|
      if @mytodo.save
        format.html { redirect_to @mytodo, notice: 'Mytodo was successfully created.' }
        format.json { render json: @mytodo, status: :created, location: @mytodo }
      else
        format.html { render action: "new" }
        format.json { render json: @mytodo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mytodos/1
  # PUT /mytodos/1.json
  def update
    @mytodo = Mytodo.find(params[:id])

    respond_to do |format|
      if @mytodo.update_attributes(params[:mytodo])
        format.html { redirect_to @mytodo, notice: 'Mytodo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mytodo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mytodos/1
  # DELETE /mytodos/1.json
  def destroy
    @mytodo = Mytodo.find(params[:id])
    @mytodo.destroy

    respond_to do |format|
      format.html { redirect_to mytodos_url }
      format.json { head :no_content }
    end
  end
end
