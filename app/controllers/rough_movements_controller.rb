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
