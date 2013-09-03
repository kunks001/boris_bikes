class Garage

require 'van'
require 'bike'

	def initialize
		@bike_rack = Array.new
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
    	bike_rack.each do |bike|
			if bike.broken? == false		
				van.fixed_bikes << bike
			end
		@bike_rack = []
		end
	end
end