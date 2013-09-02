require './lib/station'

describe Station do

let(:station) {Station.new("Old_Street")}

	it 'should have a name' do
		# old_street = Station.new("Old Street")
		station.name == "Old_Street"
	end

	it 'should not respond to incorrect name' do
		# old_street = Station.new("Old Street")
		station.name != "St Pancras"
	end

	it 'should initialise with an empty array' do
		station.bikes.count == 0
	end
 	
 	it 'should have 25 bikes at the start of the day' do
 		station.bikes_daily_setup
 		station.bikes.count == 25
 	end

 	it 'should have space for thirty bikes' do
 		station.bikes_daily_setup
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

	it 'should know when it has bikes left' do
		station.bikes_daily_setup
		station.are_there_bikes? == true
	end
	
	it 'should know when it has no bikes left' do
		station.are_there_bikes? == false
	end

end