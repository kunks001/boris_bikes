require './lib/bike'

describe Bike do

	let(:bike) {Bike.new}
	let(:broken_bike) {Bike.new.gets_broken}

	it 'should not be broken' do
		bike.broken?.should == false
	end

	it 'should be broken once it breaks' do
		broken_bike.broken?.should == true
	end

	it 'should recognise when it is fixed' do
		broken_bike.fix

		bike.broken?.should == false
	end
end