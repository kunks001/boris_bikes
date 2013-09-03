class Station
require 'bike'
attr_accessor :bicycles

	def initialize(name)
		@name = name
		@bicycles = Array.new
	end

	def name
		@name
	end

  def id
  end

	def bicycles
		@bicycles
	end

	def bikes_daily_setup
		res = 0
		while res < 25
			bike = Bike.new
			@bicycles << bike
			res += 1
		end
	end

	def bikes_available?
		@bicycles.count > 0? true : false
	end

	def space?
		@bicycles.count < 30? true : false
	end
end
