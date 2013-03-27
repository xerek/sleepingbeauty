#    rough_movements_controller.rb
# Purpose: Mid term demo
# Author: Matheus Camargo
#         matheus@go.wustl.edu
# CSE 467S -- Embedded Computing Systems
# WUSTL, Spring 2013
# Date: Mar., 26, 2013
#
# Description
#    Controller of MVC architecture for the rough movements in the accelerometer
# Version Log
#    3/27/2013, Matheus Camargo
#       I added the json option for the rough movements
#
class RoughMovementsController < ApplicationController

  # create
  # url post /rough_movements
  # This method creates a set Rough movements from post of format 
  # rough_mov[i][roughy]; rough_mov[i][time]
  def create
    params[:rough_movs].each do |id, parameters|
      RoughMovement.create(parameters)
    end

    render :nothing => true
  end

  # index
  # url get /rough_movements.xml
  # Params: (optional) start_time
  # Returns all accel_data, after start_time if given
  def index
    if params[:start_time]
      @rough_movs = RoughMovement.where("time >= ?", params[:start_time].to_f).order("time")
    else
      @rough_movs = RoughMovement.order("time")
    end

    respond_to do |format|
      format.html
      format.xml { render :xml => @rough_movs }
      format.json { render :content_type => 'application/json' }
    end
  end

  # last_time
  # url get /rough_movements/last_time.txt
  # Params: (optional) really_rough
  # Returns the last rough movement. If really_rough = 1, returns the last really rough movement
  def last_time
    if params[:really_rough] and params[:really_rough] == "1"
      @rough_mov = RoughMovement.where("really_rough = ?", true).last
    else
      @rough_mov = RoughMovement.last
    end

    respond_to do |format|
      if @rough_mov
        # format.html
        format.text { render :text => @rough_mov.time.to_i }
      else
        # format.html
        format.text { render :text => "-1" }
      end
    end
  end

end
