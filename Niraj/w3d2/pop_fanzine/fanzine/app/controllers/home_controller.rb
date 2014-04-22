class HomeController < ApplicationController
  protect_from_forgery

  def index
    render 'index'
  end

  def bio
    render 'bio'
  end

   def music
    render 'music'
  end
  
   def video
    render 'video'
  end
  
   def review
    render 'review'
  end
  
  
end
