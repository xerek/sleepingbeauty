class AccelData < ActiveRecord::Base
  attr_accessible :bpm, :measure_time, :x, :y, :z

  validates :measure_time, :presence => true
  validates :x, :presence => true
  validates :y, :presence => true
  validates :z, :presence => true

end
