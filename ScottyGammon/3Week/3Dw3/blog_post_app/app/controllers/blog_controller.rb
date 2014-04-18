class BlogController < ApplicationController
  def index
  
    @blogs = BlogPost.all

  end
end
