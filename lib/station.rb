class Station

	def initialize(name)
		@name = name
		@bicycles = Array.new
		@broken_bicycles = Array.new
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

	def broken_bicycles
		@broken_bicycles
	end

	def bikes_daily_setup
		res = 0
		while res < 25
			bike = Bike.new
			@bicycles << bike
			res += 1
		end
	end

  # BROKEN
	def total_number_of_bicycles
    total_bicycles_count
	end

  def total_bicycles_count
    broken_bicycles.length + bicycles.length
  end

	def rent_to
	    @bicycles.shift if bikes_available?
	end

	def bike_returned_by(person)
        if space?
        	broken_or_working?(person)
  		else
  			"Sorry, there is no space at this station"
  		end
  	end

  	def broken_or_working?(person)
  		if person.bike.broken?
      			@broken_bicycles << person.bike 	
  			else
  				@bicycles << person.bike
  			end
  		nil
  	end

	def has_how_many_bikes?
		@bicycles.count
	end

	def bikes_available?
		@bicycles.count > 0? true : false
	end

	def space?
		total = total_number_of_bicycles 
		total < 30? true : false
	end

	def takes_bikes_from_van(van)
		van.fixed_bikes.each do |bike|
			@bicycles << bike
		end
		[]
	end
end
