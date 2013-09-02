class Person

  def initialize(name)  
    @name = name  
    @bike = 0  
  end  
  
  def name  
    @name
  end

  def id
  end

  def bike
    @bike
  end

  def gets_bike
    @bike +=1
  end

  def returns_bike
    @bike -=1
  end
end