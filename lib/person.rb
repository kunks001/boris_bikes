class Person

require 'station'
require 'bike'
attr_accessor :bicycles

  def initialize(name)  
    @name = name  
    @bike = nil
  end 
  
  def name  
    @name
  end

  def id
  end

  def bike
    @bike
  end

  def rent(station)
    @bike = station.rent_to
    # TO DO: make sure person can only have one bike at a time 
  end

  def breaks_bike(probability = nil)
    probability ||= rand(1..6)
    if probability == 6
      self.bike.gets_broken
    end
  end

  #TO DO: make sure person cycles somewhere

  def return_bike(station)
   @bike = station.bike_returned_by(self)
  end
end