class HomeController < ApplicationController
  def start
    
    render 'menu'
  end

  def station
    @start_line = params[:start_line].to_sym
    @finish_line = params[:finish_line].to_sym
    @start_line_print = @start_line.to_s.gsub("_", " ").capitalize
    @finish_line_print = @finish_line.to_s.gsub("_", " ").capitalize

    @subway = {l_line: [ "8th", "6th", "Union Square", "3rd", "1st"],
    n_line: ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
    :"6" => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"],
    b_line: ["Rockefeller Center", "42nd", "34th", "23rd", "6th", "Washington Square"],
    :"Union Square" => [:l_line, :n_line, :"6"],
    :"6th" => [:l_line, :b_line],
    :"34th" => [:b_line, :n_line]
      }

    render 'station_menu'
  end

  def journey
    @test = params

    subway = {l_line: [ "8th", "6th", "Union Square", "3rd", "1st"],
      n_line: ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
      :"6" => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"],
      b_line: ["Rockefeller Center", "42nd", "34th", "23rd", "6th", "Washington Square"],
      :"Union Square" => [:l_line, :n_line, :"6"],
      :"6th" => [:l_line, :b_line],
      :"34th" => [:b_line, :n_line]
        }
      # note: 6th interchange for l and b; union square for l, n and 6; 34th for the b and the n; 



    def intersect(start_line, start_station, finish_line, finish_station, intersection, transport_system)
      if transport_system[intersection].include?(start_line) && transport_system[intersection].include?(finish_line) 
        distance_start_line = (transport_system[start_line].index(start_station) - transport_system[start_line].index(intersection.to_s)).abs
        distance_finish_line = (transport_system[finish_line].index(finish_station) - transport_system[finish_line].index(intersection.to_s)).abs
        distance = distance_start_line + distance_finish_line
       
      end
    end

    start_line = params[:start_line].to_sym
    finish_line = params[:finish_line].to_sym
    start_station = params[:start_station].to_s
    finish_station = params[:finish_station].to_s

    start_line_print = start_line.to_s.gsub("_", " ").capitalize
    finish_line_print = finish_line.to_s.gsub("_", " ").capitalize


    intersection = false

    if start_line == finish_line
      distance = (subway[start_line].index(start_station) - subway[finish_line].index(finish_station)).abs 
    else 
      routes = { }
      routes[:"Union Square"] = intersect(start_line, start_station, finish_line, finish_station, :"Union Square", subway) 
      routes[:"6th"] = intersect(start_line, start_station, finish_line, finish_station, :"6th", subway) 
      routes[:"34th"] = intersect(start_line, start_station, finish_line, finish_station, :"34th", subway) 
      routes.delete_if { |intersection, distance| distance == nil }.min
      intersection = routes.keys.to_s
      distance = routes.values.to_s
    end


    if distance == "[ ]"
      @output1 = "Sorry.  I haven't figured out routes via 2 changes. So you are SOL if you want to go between the b and 6 lines."
    else
      @output1 = "You'll travel #{distance} stops to get from #{start_station} on the #{start_line_print} to #{finish_station} on the #{finish_line_print}.".delete '[]_:"'
      @output2 =  "You'll need to make a change at #{intersection}.".delete '[]_:"' if intersection 
    end


    render 'menu'
  end
end



    


