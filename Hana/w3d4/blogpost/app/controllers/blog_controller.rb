class BlogController < ApplicationController
  def index
    @michael = 'possum'
    @blogs = BlogPost.all
  end
end
