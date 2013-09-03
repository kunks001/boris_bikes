require './lib/station'

describe Station do

let(:station) {Station.new("Old_Street")}

	it 'should have a name' do
  		station.name == "Old_Street"
	end

	it 'should not respond to incorrect name' do
		station.name != "St Pancras"
	end

	it 'should initialise with an empty array' do
		station.bicycles.count == 0
	end
 	
 	it 'should have 25 bicycles at the start of the day' do
 		station.bikes_daily_setup
 		station.bicycles.count == 25
 	end

 	it 'should have space for thirty bicycles' do
 		station.bikes_daily_setup
		station.space? == true
	end

	it 'should not have space for more than thirty bicycles' do
		res = 0
		while res < 30
			bike = Bike.new
			station.bicycles << bike
			res += 1
		end
		station.space? == false
	end

	it 'should know when it has bicycles left' do
		station.bikes_daily_setup
		station.bikes_available? == true
	end

	it 'should know when it has no bicycles left' do
		station.bikes_available? == false
	end

end