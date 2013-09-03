class Bike

  def initialize
  	@broken = false
  end

  def broken?
  	@broken
  end

  def gets_broken
  	@broken = true
    self
  end

  def fix
    @broken = false
  end

  def id
  end
end
