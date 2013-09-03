class Garage

require 'van'
require 'bike'

	def initialize
		@bike_rack = Array.new
	end

	def bike_rack
		@bike_rack
	end

	def take_bikes_from_van(van)
		@bike_rack << van.broken_bikes
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
		end
	end
end