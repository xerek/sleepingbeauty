class AccelDatasController < ApplicationController

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

  def index
    if params[:start_time]
      @accel_datas = AccelData.where("measure_time >= ?", params[:start_time].to_f)
    else
      @accel_datas = AccelData.all
    end

    respond_to do |format|
      format.html
      format.xml { render :xml => @accel_datas }
      format.text { render :text => @accel_datas.map{ |ad| [ad.x, ad.y, ad.z, ad.measure_time.to_i].join(",") }.join("\n") }
    end
  end

end
