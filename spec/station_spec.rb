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

	it 'should initialise with 25 spaces' do
		station.bikes.count == 25
	end
 	
 	it 'should have 20 bikes at the start of the day' do
 		station.bikes_at_day_start
 		
 		res[bike] == 20
 	end
end