#    rough_movement.rb
# Purpose: Mid term demo
# Author: Matheus Camargo
#         matheus@go.wustl.edu
# CSE 467S -- Embedded Computing Systems
# WUSTL, Spring 2013
# Date: Mar., 26, 2013
#
# Description
#   Model of MVC architecture for the rough movement data
#
class RoughMovement < ActiveRecord::Base
  attr_accessible :roughy, :time

  validates :roughy, :inclusion => { :in => [true, false] }
  validates :time, :presence => true

  after_create do
    if self.roughy?
      LightPower.create(:time => self.time, :on => true)
    end
  end

end
