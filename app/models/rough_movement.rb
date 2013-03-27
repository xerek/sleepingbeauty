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
# Version Log
#   3/27/2013, Matheus Camargo
#      Added x, y, z to calculate the linear accelaration in the plot
#
class RoughMovement < ActiveRecord::Base
  attr_accessible :really_rough, :time, :x, :y, :z

  validates :really_rough, :inclusion => { :in => [true, false] }
  validates :time, :presence => true
  validates :x, :presence => true
  validates :y, :presence => true
  validates :z, :presence => true

end
