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

		it 	'should collect broken bikes' do
      array = Array.new(10,Bike.new).each{|bike| bike.gets_broken}
      station.instance_variable_set(:@bicycles, array)
      van.take_broken_bikes(station)

      van.broken_bikes.count.should == 10
		end

    it 'should only collect broken bikes' do
      array = Array.new(10,Bike.new)
      station.instance_variable_set(:@bicycles, array)
      
      van.take_broken_bikes(station)
      van.broken_bikes.count.should == 0
    end

    it 'should deliver broken bikes' do
      array = Array.new(10,Bike.new).each{|bike| bike.gets_broken}
      van.instance_variable_set(:@broken_bikes, array)
      van.deliver_broken_bikes(garage)

      van.broken_bikes.count.should == 0
    end 

    it 'should collect fixed bikes' do
      array = Array.new(10,Bike.new)
      garage.instance_variable_set(:@bike_rack, array)

      van.takes_fixed_bikes(garage)
      van.fixed_bikes.count.should == 10
    end

    it 'should not collect broken bikes' do
      array = Array.new(10,Bike.new).each{|bike| bike.gets_broken}
      garage.instance_variable_set(:@bike_rack, array)
      
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