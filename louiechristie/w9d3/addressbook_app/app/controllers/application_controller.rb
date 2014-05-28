class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_people

  def load_people
    @people = Person.all
  end

end
