class TenLinesController < ApplicationController
  # GET /ten_lines
  # GET /ten_lines.json
  def index
    @ten_lines = TenLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ten_lines }
    end
  end

  # GET /ten_lines/1
  # GET /ten_lines/1.json
  def show
    @ten_line = TenLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ten_line }
    end
  end

  # GET /ten_lines/new
  # GET /ten_lines/new.json
  def new
    @ten_line = TenLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ten_line }
    end
  end

  # GET /ten_lines/1/edit
  def edit
    @ten_line = TenLine.find(params[:id])
  end

  # POST /ten_lines
  # POST /ten_lines.json
  def create
    @ten_line = TenLine.new(params[:ten_line])

    respond_to do |format|
      if @ten_line.save
        format.html { redirect_to @ten_line, notice: 'Ten line was successfully created.' }
        format.json { render json: @ten_line, status: :created, location: @ten_line }
      else
        format.html { render action: "new" }
        format.json { render json: @ten_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ten_lines/1
  # PUT /ten_lines/1.json
  def update
    @ten_line = TenLine.find(params[:id])

    respond_to do |format|
      if @ten_line.update_attributes(params[:ten_line])
        format.html { redirect_to @ten_line, notice: 'Ten line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ten_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ten_lines/1
  # DELETE /ten_lines/1.json
  def destroy
    @ten_line = TenLine.find(params[:id])
    @ten_line.destroy

    respond_to do |format|
      format.html { redirect_to ten_lines_url }
      format.json { head :no_content }
    end
  end
end
