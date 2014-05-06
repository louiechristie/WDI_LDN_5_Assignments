class HomeController < ApplicationController

def index
  @categories = Category.all
  @movies = Movie.all
 
end

end