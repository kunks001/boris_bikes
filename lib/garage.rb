class Garage

  attr_writer :bike_rack

	def initialize
		@bike_rack = []
	end

	def bike_rack
		@bike_rack
	end

	def takes_bikes_from_van(van)
		van.broken_bikes.each do |bike|
			@bike_rack << bike
		end
		[]
	end

	def fix_bikes
		bike_rack.each do |bike|
			bike.fix
  	end
  end

  def return_fixed_bikes(van)
    bikes = bike_rack.reject { |bike| bike.broken? }
    @bike_rack = []

    return bikes
	end

end