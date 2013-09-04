require './lib/garage'

describe Garage do

let(:garage) {Garage.new}

	it 'should initialise with an empty array' do
		garage.bike_rack.should == []
	end

	it 'should take bikes from the van' do
		van = double(:van, {broken_bikes: Array.new(1, "bike")})
		garage.takes_bikes_from_van(van)

		garage.bike_rack.count.should == 1
	end

	it 'should_fix_bikes' do
		array = Array.new(10,Bike.new).each{|bike|bike.gets_broken}
		garage.instance_variable_set(:@bike_rack, array)
		garage.fix_bikes
			
		garage.bike_rack.first.broken?.should == false
	end

	it 'should return fixed bikes' do
		van = double(:van, {fixed_bikes: []})
		array = Array.new(10,Bike.new)
		garage.instance_variable_set(:@bike_rack, array)

		garage.return_fixed_bikes(van)
		garage.bike_rack.count.should == 0
	end
end
