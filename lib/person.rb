class Person

require 'station'
require 'bike'

attr_reader :bikes

# attr_reader :bike

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
  end
end