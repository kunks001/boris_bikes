class Van

	def initialize
	  @broken_bikes = Array.new
	  @fixed_bikes = Array.new
	end 

	def broken_bikes
		@broken_bikes
	end

	def fixed_bikes
		@fixed_bikes
	end

	def take_broken_bikes(station)		
	 	if station.broken_bicycles.count > 0
		 	station.broken_bicycles.each do |bike|
			    @broken_bikes << bike
			end
		end
	end

	def deliver_broken_bikes(garage)
		@broken_bikes = garage.takes_bikes_from_van(self)
	end

	def takes_fixed_bikes(garage)
		@fixed_bikes = garage.return_fixed_bikes(self)
	end

	def deliver_fixed_bikes(station)
		@fixed_bikes = station.takes_bikes_from_van(self)
	end
end