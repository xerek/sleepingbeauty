#    accel_data.rb
# Purpose: Mid term demo
# Author: Matheus Camargo
#         matheus@go.wustl.edu
# CSE 467S -- Embedded Computing Systems
# WUSTL, Spring 2013
# Date: Mar., 23, 2013
#
# Description
#   Model of MVC architecture for the accelerometer datas
# Version log
#   3/25/2013, Matheus Camargo
#      Adding validation for presence of measure_time, x, y and z
#
class AccelData < ActiveRecord::Base
  attr_accessible :bpm, :measure_time, :x, :y, :z

  validates :measure_time, :presence => true
  validates :x, :presence => true
  validates :y, :presence => true
  validates :z, :presence => true

end
