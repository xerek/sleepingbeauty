class LightPower < ActiveRecord::Base
  attr_accessible :on, :time

  validates :on, :inclusion => { :in => [true, false] }
  validates :time, :presence => true

end
