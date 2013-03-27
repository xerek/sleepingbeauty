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
