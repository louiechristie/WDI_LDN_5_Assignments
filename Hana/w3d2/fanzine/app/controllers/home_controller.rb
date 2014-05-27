class HomeController < ApplicationController
  def start
    render 'menu'
  end

  def before
    @which_action = 'before'
    render 'before'
  end

  def after
    @which_action = 'after'
    render 'after'
  end

  def gallery
    @which_action = 'gallery'
    render 'gallery'
  end

  def news
    @which_action = 'news'
    render 'news'
  end

  def videos
    @which_action = 'videos'
    render 'videos'
  end

  def door
    case params['option'].downcase
      when 'before' then redirect_to('/before')
      when 'after' then redirect_to('/after')
      when 'gallery' then redirect_to('/gallery')
      when 'news' then redirect_to('/news')
      when 'videos' then redirect_to('/3')
      else render 'menu'
    end
  end
endclass HomeController < ApplicationController
end
