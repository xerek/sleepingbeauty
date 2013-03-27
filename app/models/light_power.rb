#    light_power.rb
# Purpose: Mid term demo
# Author: Matheus Camargo
#         matheus@go.wustl.edu
# CSE 467S -- Embedded Computing Systems
# WUSTL, Spring 2013
# Date: Mar., 26, 2013
#
# Description
#   Model of MVC architecture for the light power data
#
class LightPower < ActiveRecord::Base
  attr_accessible :on, :time

  validates :on, :inclusion => { :in => [true, false] }
  validates :time, :presence => true

end
