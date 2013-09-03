require './lib/station'
require './lib/bike'
require './lib/person'
require './lib/van'

describe Station do

let(:station) {Station.new("Old_Street")}
let(:person) {Person.new("Srikanth")}
let(:van) {Van.new}

	it 'should have a name' do
  		station.name.should == "Old_Street"
	end

	it 'should not respond to incorrect name' do
		station.name.should_not == "St Pancras"
	end
 	
 	it 'should initialise with an array of 25 bikes' do
 		station.bicycles.count.should == 25
 	end

  it 'can count how many bikes there are' do
    station.has_how_many_bikes?.should == 25
  end

 	it 'should have space for thirty bicycles' do
    4.times{ station.bicycles << "bike" }
    station.space?.should == true
	end

	it 'should not have space for more than thirty bicycles' do
		5.times{ station.bicycles << "bike" }
    station.space?.should == false
	end

	it 'should know when it has bicycles left' do
		station.bikes_available?.should == true
	end

	it 'should know when it has no bicycles left' do
    25.times{ station.bicycles.shift }
		station.bikes_available?.should == false
	end

  # it 'should know if it has no working bikes' do
  #   array = Array.new(5,Bike.new).each{|bike|bike.gets_broken}
  #   station.instance_variable_set(:@bicycles, array)
  #   station.are_all_bikes_broken?.should == true
  # end

  # it 'should know if it has any unbroken bikes' do
  #   station.are_all_bikes_broken?.should == false
  # end

  it 'should lose a bike once it is rented' do
    station.rent_to
    station.bicycles.count.should == 24
  end

  it 'should gain a bike once it is returned' do
    bike = Bike.new
    person = double(:person, { bike: bike })

    station.bike_returned_by(person)
    station.bicycles.count.should == 26
  end

  it 'should gain a broken bike once it is returned' do
    bike = Bike.new
    person = double(:person, { bike: bike.gets_broken })
    
    station.bike_returned_by(person)
    station.broken_bicycles.count.should == 1
  end

  it 'has consistent object id from station to person' do
    object = station.bicycles.first
    person.rent(station)
    person.bike.should == object
  end

  it 'has consistent object id from person to station' do
    bike = Bike.new
    person = double(:person, { bike: bike })
    station.bike_returned_by(person)

    station.bicycles.last.should == bike
  end

  it 'takes fixed bikes from the van' do
    array = Array.new(2,Bike.new)
    van.instance_variable_set(:@fixed_bikes, array)

    station.takes_bikes_from_van(van)
    station.bicycles.count.should == 27
  end

end



