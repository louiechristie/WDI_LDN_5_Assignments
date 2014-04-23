class HomeController < ApplicationController
  def start
    render 'index'
  end

  def bio
    render 'bio'
  end

  def photos
    render 'photos'
  end

  def music
    render 'music'
  end

  def video
    render 'video'
  end

  
end