class AccelData < ActiveRecord::Base
  attr_accessible :bpm, :measure_time, :x, :y, :z, :time_in_milliseconds

  def time_in_milliseconds
    self.measure_time.strftime("%s") + "000"
  end

  def time_in_milliseconds=(milliseconds)
    self.measure_time = DateTime.strptime((milliseconds.to_f/1000).to_s, "%s")
  end

end
