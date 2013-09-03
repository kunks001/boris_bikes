class Van

require 'station'
require 'bike'
require 'garage'

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
		station.bicycles.each do |bike|
		    if bike.broken? == true
		      @broken_bikes << bike
	      	end
	    end
	end

	def deliver_broken_bikes(garage)
		@broken_bikes = garage.take_bikes_from_van(self)
	end

	def take_fixed_bikes(garage)
		garage.bike_rack.each do |bike|
			if bike.broken? == false		
				@fixed_bikes << bike
			end
		end
	end
end