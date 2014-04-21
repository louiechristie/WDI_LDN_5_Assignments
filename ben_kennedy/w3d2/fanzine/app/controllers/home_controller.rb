class HomeController < ApplicationController
  def start
    render 'menu'
  end

  def john
    @which_action = '/john'
    render 'john'
  end

  def paul
    @which_action = '/paul'
    render 'paul'
  end

  def george
    @which_action = '/george'
    render 'george'
  end

  def ringo
    @which_action = '/ringo'
    render 'ringo'
  end

  def tour_dates
    @which_action = '/tour_dates'
    render 'menu'
  end

  def door
    case params['option'].downcase
      when 'john' then redirect_to('/john')
      when 'paul' then redirect_to('/paul')
      when 'ringo' then redirect_to('ringo1')
      when '2' then redirect_to('ringo2')
      when '3' then redirect_to('/3')
      else render 'menu'
    end
  end
end