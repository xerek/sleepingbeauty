class RoughMovement < ActiveRecord::Base
  attr_accessible :roughy, :time

  validates :roughy, :presence => true
  validates :time, :presence => true

end
