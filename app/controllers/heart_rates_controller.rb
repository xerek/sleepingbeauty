#    heart_rates_controller.rb
# Purpose: Mid term demo
# Author: Matheus Camargo
#         matheus@go.wustl.edu
# CSE 467S -- Embedded Computing Systems
# WUSTL, Spring 2013
# Date: Mar., 26, 2013
#
# Description
#    Controller of MVC architecture for the heart rate monitor in the Arduino
#
class HeartRatesController < ApplicationController

  # create
  # url post /heart_rates
  # This method creates a heart rate from post of format 
  # heart_rate[rate]; heart_rate[time]
  def create
    @heart_rate = HeartRate.new(params[:heart_rate])

    respond_to do |format|
      if @heart_rate.save
        # format.html
        format.xml { render :xml => @heart_rate, :status => :created, :location => @heart_rate }
      else
        # format.html
        format.xml { render :xml => @heart_rate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # index
  # url get /heart_rates
  # Params: (optional) start_time
  # Returns all heart rates, after start_time if given
  def index
    if params[:start_time]
      @heart_rates = HeartRate.where("time >= ?", params[:start_time].to_f).order("time")
    else
      @heart_rates = HeartRate.order("time")
    end

    @heart_rates = @heart_rates.each_slice([@heart_rates.size, 2000].max/2000).map(&:first)

    respond_to do |format|
      format.html
      format.xml { render :xml => @heart_rates }
      format.json { render :json => @heart_rates }
    end
  end

end
