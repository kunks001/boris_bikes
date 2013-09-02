require './lib/bike'

describe Bike do
	it 'should not be broken' do
		bike = Bike.new
		bike.broken? == false
	end

	it 'should be broken once it breaks' do
		bike = Bike.new
		bike.break
		bike.broken? == true
	end
end