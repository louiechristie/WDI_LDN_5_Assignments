class HomeController < ApplicationController
  before_filter :authenticate_user!


def band
render 'band'
end

def history
  render 'history'
end

def george
  render 'george'
end

def andrew
  render 'andrew'
end

def music
  render 'music'
end

def gallery
  render 'gallery'
end


end
