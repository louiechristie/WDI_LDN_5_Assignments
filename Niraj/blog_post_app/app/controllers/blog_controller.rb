class BlogController < ApplicationController
  def index


    @michael ="possem"

    @blogs = BlogPost.all
  end
end
