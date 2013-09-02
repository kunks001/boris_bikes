require './lib/station'

describe Station do

	it 'should have a location' do
		old_street = Station.new("Old Street")
		old_street.location == "Old Street"
	end

	it 'should not respond to incorrect location' do
		old_street = Station.new("Old Street")
		old_street.location != "St Pancras"
	end

end