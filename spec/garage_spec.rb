require './lib/garage'

describe Garage do

let(:garage) {Garage.new}

let(:van) {double(:van)}
let(:bike) {double(:bike, broken?: false)}

	it 'should initialise with an empty array' do
		garage.bike_rack.should == []
	end

	it 'should take bikes from the van' do
		van = double(:van, {broken_bikes: Array.new(1, "bike")})
		garage.takes_bikes_from_van(van)

		garage.bike_rack.count.should == 1
	end

	it 'should fix a bike rack with one bike' do
    bike = double(:bike)
    garage.bike_rack = [bike]

    expect(bike).to receive :fix

    garage.fix_bikes
	end

  it 'should fix a bike rack with 2 bikes' do
    bike = double(:bike)
    other_bike = double(:bike)

    garage.bike_rack = [bike, other_bike]

    expect(bike).to receive :fix
    expect(other_bike).to receive :fix

    garage.fix_bikes
  end

	it 'should return fixed bikes' do
    bikes = [bike, bike]

    garage.bike_rack = bikes
    garage.return_fixed_bikes(van).should == bikes
	end

  it 'should empty the bike rack after returning fixed bikes' do
    van = double(:van, {fixed_bikes: []})
    array = Array.new(10,Bike.new)
    garage.instance_variable_set(:@bike_rack, array)

    garage.return_fixed_bikes(van)
    garage.bike_rack.count.should == 0
  end
end
