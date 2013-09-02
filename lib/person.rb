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

  def rent
    if @bike == nil
      self.bike == Station.bicycles.slice(1)
    else
    end
  end
end