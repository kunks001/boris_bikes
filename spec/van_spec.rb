class Van

require './lib/bike'
require './lib/station'
require './lib/van'
require './lib/garage'

	describe Van do

		let(:van) {Van.new}
    let(:garage) {Garage.new}
		let(:station) {Station.new("Old Street")}
    let(:bike) {Bike.new}
    let(:bike_broken_array) {Array.new(10,Bike.new).each{
                             |bike| bike.gets_broken}}
    let(:bike_array) {Array.new(10,Bike.new)}

		it 	'should collect broken bikes' do
      station.instance_variable_set(:@broken_bicycles, bike_broken_array)
      van.take_broken_bikes(station)

      van.broken_bikes.count.should == 10
		end

    it 'should only collect broken bikes' do
      van.take_broken_bikes(station)
      van.broken_bikes.count.should == 0
    end

    it 'should deliver broken bikes' do
      van.instance_variable_set(:@broken_bikes, bike_broken_array)
      van.deliver_broken_bikes(garage)

      van.broken_bikes.count.should == 0
    end 

    it 'should collect fixed bikes' do
      garage.instance_variable_set(:@bike_rack, bike_array)

      van.takes_fixed_bikes(garage)
      van.fixed_bikes.count.should == 10
    end

    it 'should not collect broken bikes from garage' do
      garage.instance_variable_set(:@bike_rack, bike_broken_array)
      
      van.takes_fixed_bikes(garage)
      van.fixed_bikes.count.should == 0
    end

    it 'should return fixed bikes' do
      array = Array.new(2,Bike.new)
      van.instance_variable_set(:@fixed_bikes, array)

      van.deliver_fixed_bikes(station)
      van.fixed_bikes.count.should == 0
    end
  end

end