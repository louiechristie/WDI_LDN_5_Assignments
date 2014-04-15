class HomeController < ApplicationController
  


  def index

  n = [:nts, :n34, :n28, :n23, :us, :n8]
  l = [:l8, :l6, :us, :l3, :l1]
  s = [:sgc, :s33, :s28, :s23, :us, :sap]
  subway = { n: n, l: l, s: s}

  if params[:start_line] && params[:start_line] > "" && params[:start_point] && params[:start_point] > "" && params[:end_line] && params[:end_line] > "" && params[:end_point] && params[:end_point] > ""

    start_line = params[:start_line].to_sym
    start_point = params[:start_point].to_sym 
    end_line = params[:end_line].to_sym 
    end_point = params[:end_point].to_sym

    # calculate the distance if they are both on the same end_line
    if start_line == end_line
      length = (subway[start_line].index(start_point) - subway[start_line].index(end_point)).abs

    # calculate the distance if they are on different lines
    else
      #get intersection
      intersection = (subway[start_line] & subway[end_line])[0]

      #get distance from start point to intersection
      start_line_distance = (subway[start_line].index(start_point) - subway[start_line].index(intersection)).abs

      #get distance from end point to intersection
      end_line_distance = (subway[end_line].index(end_point) - subway[end_line].index(intersection)).abs

      #add distances together
      length = start_line_distance + end_line_distance
    end
    # output the distance to screen


      @result = length
      @start_line = start_line
      @start_point = start_point
      @end_line = end_line
      @end_point = end_point

      render 'index'
    end
  end #endif params exist
 
end