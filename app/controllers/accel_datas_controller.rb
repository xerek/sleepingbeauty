class AccelDatasController < ApplicationController

  def create
    @accel_data = AccelData.new(params[:accel_data])

    respond_to do |format|
      if @accel_data.save
        # format.html
        format.xml { render :xml => @accel_data, :status => :created, :location => @accel_data }
      else
        # format.html
        format.xml { render :xml => @accel_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  def index
    if params[:start_time]
      start_time = DateTime.strptime(params[:start_time], "%s")
      @accel_datas = AccelData.where("measure_time >= ?", start_time)
    else
      @accel_datas = AccelData.all
    end

    respond_to do |format|
      format.html
      format.xml { render :xml => @accel_datas }
      format.text { render :text => @accel_datas.map{ |ad| [ad.x, ad.y, ad.z, ad.time_in_milliseconds].join(",") }.join("\n") }
    end
  end

end
