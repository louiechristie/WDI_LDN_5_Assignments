class HomeController < ApplicationController

  def home
    @lines = { "n" => %w(ts 34th 28th-n 23rd-n US 8th-n),
          "l" =>  %w(8th-l 6th US 3rd 1st),
          "s" => %w(GC 33rd 28th-s 23rd-s US AP)}
    
              render 'home'
  end

  
  def result
    @lines = { "n" => %w(ts 34th 28th-n 23rd-n US 8th-n),
          "l" =>  %w(8th-l 6th US 3rd 1st),
          "s" => %w(GC 33rd 28th-s 23rd-s US AP)}
      if params[:station_on].nil?    
         render 'home'
      else
        @journey_start = params[:station_on].split(',')
        @journey_end = params[:station_off].split(',')
        @dist = mta(@journey_start, @journey_end, @lines)       
        render 'result'
      end
      

  end

  def mta (journey_start, journey_end, lines)
      
      get_on_line = journey_start[0]
      get_on_stop = journey_start[1]

      get_off_line = journey_end[0]
      get_off_stop = journey_end[1]

      if get_on_line == get_off_line 
        distance_travelled = (lines[get_on_line].find_index(get_on_stop) - lines[get_off_line].find_index(get_off_stop)).abs 


      else 
        intersect_station = (lines[get_on_line] & lines[get_off_line])[0]
        distance_travelled_first_line = (lines[get_on_line].find_index(get_on_stop) - lines[get_on_line].find_index(intersect_station)).abs 
        distance_travelled_second_line = (lines[get_off_line].find_index(get_off_stop) - lines[get_off_line].find_index(intersect_station)).abs 
        distance_travelled = distance_travelled_first_line + distance_travelled_second_line
      end

      
      distance_travelled
  
  
  end

end
