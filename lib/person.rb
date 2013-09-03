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
    station.bikes_available?
    if @bike == nil
      @bike = station.bicycles.shift
    else
    end
  end
end