class RoughMovement < ActiveRecord::Base
  attr_accessible :roughy, :time

  validates :roughy, :inclusion => { :in => [true, false] }
  validates :time, :presence => true

end
