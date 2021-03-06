class NotesController < ApplicationController
  respond_to :json
  
  def index
    @notes = Note.all
    respond_with @notes
  end

  def create
    @note = Note.new params[:note]
    if @note.save
      respond_with @note, status: :accepted
    else
      respond_with @note, status: :unproccessable_entity
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update_attributes params[:note]
      respond_with @note, status: :accepted
    else
      respond_with @note, status: :unproccessable_entity
    end
  end 

end
