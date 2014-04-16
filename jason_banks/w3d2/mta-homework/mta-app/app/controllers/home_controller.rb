class HomeController < ApplicationController

def home

  n_line = ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"]
  l_line = ["8th", "6th", "Union Square", "3rd", "1st"]
  six_line = ["Grand Central", "33rd", "28th","23rd", "Union Square", "Astor Place"]

  @mta_lines = {"N line" => n_line, "L line" => l_line, "6 line" => six_line}

  render 'home'
end

def choices

  n_line = ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"]
  l_line = ["8th", "6th", "Union Square", "3rd", "1st"]
  six_line = ["Grand Central", "33rd", "28th","23rd", "Union Square", "Astor Place"]

  @mta_lines = {"N line" => n_line, "L line" => l_line, "6 line" => six_line}


  @beginning_line = params[:beginning_line]
  @beginning_stop = params[:beginning_stop]
  @ending_line = params[:ending_line]
  @ending_stop = params[:ending_stop]

  beginning_stop_index = @mta_lines[@beginning_line].index(@beginning_stop)
  ending_stop_index = @mta_lines[@ending_line].index(@ending_stop)


  if @beginning_line == @ending_line
    @total_stops = @ending_stop_index - @beginning_stop_index
    if @total_stops < 0
      @total_stops *= -1
    end
 else 
    first_leg = @mta_lines[@beginning_line].index("Union Square") - beginning_stop_index
      if first_leg < 0
        first_leg *= -1
      end
    second_leg = @mta_lines[@ending_line].index("Union Square") - ending_stop_index
      if second_leg < 0
        second_leg *= -1
      end
    @total_stops = first_leg + second_leg
  end

  render 'home'

end













end