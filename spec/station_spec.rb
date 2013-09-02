require './lib/station'

describe Station do

let(:station) {Station.new("Old_Street")}

	it 'should have a location' do
		# old_street = Station.new("Old Street")
		station.location == "Old_Street"
	end

	it 'should not respond to incorrect location' do
		# old_street = Station.new("Old Street")
		station.location != "St Pancras"
	end

	it 'should initialise with an empty array' do
		station.bikes.count == 0
	end
 	
 	it 'should have 25 bikes at the start of the day' do
 		station.bikes_at_day_start
 		station.bikes.count == 25
 	end

 	it 'should have space for thirty bikes' do
 		res = 0
		while res < 25
			bike = Bike.new
			station.bikes << bike
			res += 1
		end
		station.space == true
	end

	it 'should not have space for more than thirty bikes' do
		res = 0
		while res < 30
			bike = Bike.new
			station.bikes << bike
			res += 1
		end
		station.space == false
	end
end