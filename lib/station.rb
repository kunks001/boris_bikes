class Station

require 'bike'

	def initialize(location)
		@location = location
		@bikes = Array.new
	end

	def bikes_at_day_start
		res = 0
		while res < 25
			bike = Bike.new
			@bikes << bike
			res += 1
		end
	end

	def location
		@location
	end

	def bikes
		@bikes
	end

	def space
		if bikes.count < 30
			true
		else
			false
		end
	end
end
