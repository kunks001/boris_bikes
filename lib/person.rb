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
      return "There are no bikes available!"
    end
  end

  def cycle_to(station)
    probability = rand(1..6)
    if probability == 6
      @bike.gets_broken
      with_a_broken_bike
    else
    #   arrive_at(station)
    end
  end

  def arrive_at(station)
    want_to_return_bike?
  end

  def return_bike(station)
    if station.space?
      bike = @bike
      station.bicycles << bike
      @bike = nil
    else
      return "There's no space!"
    end
  end

  def with_a_broken_bike
    "Oh no, your bike is broken!"
  end
end