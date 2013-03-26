class LightPowerController < ApplicationController

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

  def last
    @last_status = LightPower.last

    respond_to do |format|
      format.text { render :text => @last_status.on.to_i }
    end
  end

end
