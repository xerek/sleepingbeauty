class RoughMovem'entsController < ApplicationController

  def create
    @rough_mov = RoughMovement.new(params[:rough_mov])

    respond_to do |format|
      if @rough_mov.save
        # format.html
        format.xml { render :xml => @rough_mov, :status => :created, :location => @rough_mov }
      else
        # format.html
        format.xml { render :xml => @rough_mov.errors, :status => :unprocessable_entity }
      end
    end
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

end
