require './lib/bike'

describe Bike do

	let(:bike) {Bike.new}

	it 'should not be broken' do
		bike.broken?.should == false
	end

	it 'should be broken once it breaks' do
		bike.gets_broken
		bike.broken?.should == true
	end
end