#   light_power_controller.rb
# Purpose: Mid term demo
# Author: Matheus Camargo
#         matheus@go.wustl.edu
# CSE 467S -- Embedded Computing Systems
# WUSTL, Spring 2013
# Date: Mar., 26, 2013
#
# Description
#    Controller of MVC architecture for the Light Power control
#
class LightPowerController < ApplicationController

  # create
  # url post /light_power
  # This method adds a change light power registry
  # Params: light_power (0 or 1) indicating if the light should be on or off
  def create
    @light_power = LightPower.new(params[:light_power])

    respond_to do |format|
      if @light_power.save
        # format.html
        format.xml { render :xml => @light_power, :status => :created, :location => @light_power }
      else
        # format.html
        format.xml { render :xml => @light_power.errors, :status => :unprocessable_entity }
      end
    end
  end

  # index
  # url get /light_power.xml
  # Params: (optional) start_time
  # Returns all accel_data, after start_time if given
  def index
    if params[:start_time]
      @light_power = LightPower.where("time >= ?", params[:start_time].to_f)
    else
      @light_power = LightPower.all
    end

    respond_to do |format|
      format.html
      format.xml { render :xml => @light_power }
    end
  end

  # last
  # url get /light_power/last.txt
  # Returns the current light status (last registry)
  def last
    @last_status = LightPower.last

    respond_to do |format|
      if @last_status
        format.text { render :text => @last_status.on ? "1" : "0" }
      else
        format.text { render :text => "0" }
      end
    end
  end

end