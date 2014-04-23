class Movie < ActiveRecord::Base
  attr_accessible :genre, :ownership, :poster, :review, :title

  def options
    "yes" 
  end
end