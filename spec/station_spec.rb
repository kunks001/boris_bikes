require './lib/station'

describe Station do

let(:station) {Station.new("Old_Street")}
let(:person) {Person.new("Srikanth")}
let(:van) {Van.new}
let(:bike) {Bike.new}

	it 'should have a name' do
  		station.name.should == "Old_Street"
	end

	it 'should not respond to incorrect name' do
		station.name.should_not == "St Pancras"
	end
 	
 	it 'should initialise with an array of 25 working bikes' do
 		station.bicycles.count.should == 25
 	end

  it 'can count how many working bicycles there are' do
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

  it 'should have space for thirty broken bicycles' do
    4.times{ station.broken_bicycles << "bike" }
    station.space?.should == true
  end

  it 'should not have space for more than thirty broken bicycles' do
    5.times{ station.broken_bicycles << "bike" }
    station.space?.should == false
  end

  it 'should calculate space with broken and working bicycles' do
    4.times{ station.broken_bicycles << bike }
    station.space?.should == true
  end

  it 'should calculate space with broken and working bicycles' do
    5.times{ station.broken_bicycles << "bike" }
    station.space?.should == false
  end

	it 'should know when it has working bicycles left' do
		station.bikes_available?.should == true
	end

	it 'should know when it has no working bicycles left' do
    25.times{ station.bicycles.shift }
		station.bikes_available?.should == false
	end

  it 'should lose a bike once it is rented' do
    station.rent_to
    station.bicycles.count.should == 24
  end

  it 'should gain a bike once it is returned' do
    person = double(:person, { bike: bike })

    station.bike_returned_by(person)
    station.bicycles.count.should == 26
  end

  it 'can determine if a returned bike is broken or working' do
    person = double(:person, { bike: bike.gets_broken })

    station.broken_or_working?(person)
    station.broken_bicycles.count.should == 1
  end

  it 'should gain a broken bike once it is returned by person' do
    person = double(:person, { bike: bike.gets_broken })
    
    station.bike_returned_by(person)
    station.broken_bicycles.count.should == 1
  end

  it 'should return a message if there is no space left' do
    person = double(:person, { bike: bike })

    array = Array.new(30,Bike.new)
    station.instance_variable_set(:@bicycles, array)

    station.bike_returned_by(person).should == "Sorry, there is no space at this station"
  end

  it 'has consistent object id from station to person' do
    object = station.bicycles.first
    person.rent(station)
    person.bike.should == object
  end

  it 'has consistent object id from person to station' do
    person = double(:person, { bike: bike })
    station.bike_returned_by(person)

    station.bicycles.last.should == bike
  end

  it 'takes only the fixed bikes from the van' do
    array = Array.new(2,Bike.new)
    van.instance_variable_set(:@fixed_bikes, array)

    station.takes_bikes_from_van(van)
    station.bicycles.count.should == 27
  end
end



