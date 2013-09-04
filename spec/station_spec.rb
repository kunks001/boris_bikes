require './lib/station'

describe Station do

let(:station) {Station.new("Old_Street")}
let(:bike) {double(:bike, { broken?: false })}
let(:bike_broken) {double(:bike, { broken?: true })}
let(:person) {double(:person, {bike: bike})}
let(:person_broken) {double(:person, { bike: bike_broken })}


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
    4.times{ station.broken_bicycles << "bike" }
    station.space?.should == true
  end

  it 'should calculate space with broken and working bicycles' do
    5.times{ station.broken_bicycles << "bike" }
    station.space?.should == false
  end

	it 'should know when it has working bicycles left' do
    array = Array.new(25,"Bike")
    station.instance_variable_set(:@bicycle, array)
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
    station.bike_returned_by(person)
    station.bicycles.count.should == 26
  end

  it 'can determine if a returned bike is broken or working' do
    station.broken_or_working?(person_broken)
    station.broken_bicycles.count.should == 1
  end

  it 'should gain a broken bike once it is returned by person' do
    station.bike_returned_by(person_broken)
    station.broken_bicycles.count.should == 1
  end

  it 'should return a message if there is no space left' do
    array = Array.new(30, "bike")
    station.instance_variable_set(:@bicycles, array)

    station.bike_returned_by(person).should == "Sorry, there is no space at this station"
  end
end



