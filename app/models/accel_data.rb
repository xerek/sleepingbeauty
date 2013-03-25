class AccelData < ActiveRecord::Base
  attr_accessible :bpm, :measure_time, :x, :y, :z

  def time_in_milliseconds
    self.measure_time.strftime("%s")
  end

  def time_in_milliseconds=(milliseconds)
    self.measure_time = DateTime.strptime((milliseconds/1000).to_s, "%s")
  end

end
