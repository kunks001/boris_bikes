class Person

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

  def rents(bike)
    @bike = bike
  end

  def returns_bike
    @bike = nil
  end
end