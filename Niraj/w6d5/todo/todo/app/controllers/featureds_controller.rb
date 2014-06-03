class FeaturedsController < ApplicationController
  # GET /featureds
  # GET /featureds.json
  def index
    @featureds = Featured.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @featureds }
    end
  end

  # GET /featureds/1
  # GET /featureds/1.json
  def show
    @featured = Featured.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @featured }
    end
  end

  # GET /featureds/new
  # GET /featureds/new.json
  def new
    @featured = Featured.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @featured }
    end
  end

  # GET /featureds/1/edit
  def edit
    @featured = Featured.find(params[:id])
  end

  # POST /featureds
  # POST /featureds.json
  def create
    @featured = Featured.new(params[:featured])

    respond_to do |format|
      if @featured.save
        format.html { redirect_to @featured, notice: 'Featured was successfully created.' }
        format.json { render json: @featured, status: :created, location: @featured }
      else
        format.html { render action: "new" }
        format.json { render json: @featured.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /featureds/1
  # PUT /featureds/1.json
  def update
    @featured = Featured.find(params[:id])

    respond_to do |format|
      if @featured.update_attributes(params[:featured])
        format.html { redirect_to @featured, notice: 'Featured was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @featured.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /featureds/1
  # DELETE /featureds/1.json
  def destroy
    @featured = Featured.find(params[:id])
    @featured.destroy

    respond_to do |format|
      format.html { redirect_to featureds_url }
      format.json { head :no_content }
    end
  end
end
