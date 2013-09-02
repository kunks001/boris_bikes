class Station

require 'bike'

	def initialize(location)
		@location = location
		@bikes = Array.new(25)
	end

	def bikes_at_day_start
		res = 0
		while res < 20
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
end
