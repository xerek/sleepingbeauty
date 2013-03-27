#    heart_monitor.rb
# Purpose: Mid term demo
# Author: Matheus Camargo
#         matheus@go.wustl.edu
# CSE 467S -- Embedded Computing Systems
# WUSTL, Spring 2013
# Date: Mar., 23, 2013
#
# Description
#   Model of MVC architecture for the heart monitor datas
#   
# => Not used due sensor problems
#
class HeartMonitor < ActiveRecord::Base
  attr_accessible :bpm
end
