class PeopleController < ApplicationController
  respond_to :json

  def index
    @people = Person.all
    respond_with @people
  end

  def create
    @person = Person.new params[:person]
    if @person.save
      respond_with @person, status: :accepted
    else
      respond_with @person, status: :unprocessible_entity
    end
  end

  def update
    @person = Person.find params[:id]
    if @person.update_attributes params[:person]
      respond_with @person, status: :accepted
    else
      respond_with @person, status: :unprocessible_entity
    end
  end
  
end
