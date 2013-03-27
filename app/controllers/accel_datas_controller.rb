#    accel_datas_controller.rb
# Purpose: Mid term demo
# Author: Matheus Camargo
#         matheus@go.wustl.edu
# CSE 467S -- Embedded Computing Systems
# WUSTL, Spring 2013
# Date: Mar., 23, 2013
#
# Description
#    Controller of MVC architecture for the accelerometer datas
# Version log
#    3/26/2013, Matheus Camargo
#        Change the creation of datas from one to multiple per request
#
class AccelDatasController < ApplicationController

  # create
  # url post /accel_datas
  # This method creates a set AccelDatas from post of format 
  # accel_data[i][x]; accel_data[i][y]; accel_data[i][z]; accel_data[i][measure_time]
  def create
    params[:accel_data].each do |id, parameters|
      begin
        AccelData.create(parameters)
      rescue Exception > error
        warn error
        retry
      end
    end

	render :nothing => true
  end

  # index
  # url get /accel_datas
  # url get /accel_datas.xml
  # url get /accel_datas.txt
  # Params: (optional) start_time
  # Returns all accel_data, after start_time if given
  def index
    if params[:start_time]
      @accel_datas = AccelData.where("measure_time >= ?", params[:start_time].to_f).order("measure_time")
    else
      @accel_datas = AccelData.order("measure_time")
    end

    respond_to do |format|
      format.html
      format.xml { render :xml => @accel_datas }
      format.text { render :text => @accel_datas.map{ |ad| [ad.x, ad.y, ad.z, ad.measure_time.to_i].join(",") }.join("\n") }
      format.json { render :content_type => 'application/json' }
    end
  end

end
