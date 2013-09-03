class Station
require 'bike'
require 'person'
attr_accessor :bicycles

	def initialize(name)
		@name = name
		@bicycles = Array.new
		bikes_daily_setup
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

	def rent_to
	    @bicycles.shift if bikes_available?
	end

	def bike_returned_by(person)
      @bicycles << person.bike if space?
      nil
		#TO DO: ensure option if station is full
	end

	def has_how_many_bikes?
		@bicycles.count
	end

	def bikes_available?
		@bicycles.count > 0? true : false
	end

	def space?
		@bicycles.count < 30? true : false
	end

	def takes_bikes_from_van(van)
		van.fixed_bikes.each do |bike|
			@bicycles << bike
		end
		[]
	end
end
