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
#
class RoughMovementsController < ApplicationController

  # create
  # url post /rough_movements
  # This method creates a set Rough movements from post of format 
  # rough_mov[i][roughy]; rough_mov[i][time]
  def create
    params[:rough_mov].each do |id, parameters|
      begin
        RoughMovement.create(parameters)
      rescue Exception > error
        warn error
        retry
      end
    end

	  render :nothing => true
  end

  # index
  # url get /rough_movements.xml
  # Params: (optional) start_time
  # Returns all accel_data, after start_time if given
  def index
    if params[:start_time]
      @rough_mov = RoughMovement.where("time >= ?", params[:start_time].to_f)
    else
      @rough_mov = RoughMovement.all
    end

    respond_to do |format|
      format.html
      format.xml { render :xml => @rough_mov }
    end
  end

  # last_time
  # url get /rough_movements/last_time.txt
  # Params: (optional) roughy
  # Returns the last rough movement. If roughy = 1, returns the last roughy movement
  def last_time
    if params[:roughy] and params[:roughy] == "1"
      @rough_mov = RoughMovement.where("roughy = ?", true).last
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
