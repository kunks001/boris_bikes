class Station
require 'bike'
attr_accessor :bikes

	def initialize(name)
		@name = name
		@bikes = Array.new
	end

	def name
		@name
	end

	def bikes
		@bikes
	end

	def bikes_daily_setup
		res = 0
		while res < 25
			bike = Bike.new
			@bikes << bike
			res += 1
		end
	end

	def are_there_bikes?
		if @bikes.count > 0
			true
		else
			false
		end
	end

	def space
		if bikes.count < 30
			true
		else
			false
		end
	end

	def id
	end
end
