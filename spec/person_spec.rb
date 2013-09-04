require './lib/person'

describe Person do

let(:person) {Person.new('Srikanth')}
let(:broken_array) {array = Array.new(25,Bike.new).each{
                   |bike| bike.gets_broken }}

  it 'should have first name equal to input' do
  	person.name.should == 'Srikanth'
  end

  it 'should have a unique id' do
    person.id != Person.new("Will").id
  end

  it 'should have no bike initially' do
		person.bike.should == nil
  end

  it 'should get a bike once it is rented' do
    bike = double(:bike)
    station = double(:station, { rent_to: bike })

    person.rent(station)
    person.bike.should eq bike
  end

  it 'cannot rent a broken bike' do
    station = double(:station, { bicycles: Array.new(25,"Bike"), 
                                 rent_to: nil})
    25.times{ station.bicycles.shift }

    person.rent(station)
    person.bike.should == nil
  end

  it 'should not have a bike once it is returned' do
    station = double(:station, { bike_returned_by: nil })

    person.return_bike(station)
    person.bike.should eq nil
  end

  it 'should have the same bike object that was at the station' do
    station = double(:station, { rent_to: "bike"})
    object = station.rent_to
    person.rent(station)

    person.bike.should eq object
  end

  it 'should have a one in six chance of breaking the bike' do
    bike = double(:bike, { gets_broken: true})

    person.instance_variable_set(:@bike, bike)
    person.breaks_bike(6).should == true 
  end

  it 'should have a five in six chance of not breaking the bike' do
    person.breaks_bike(5).should == nil 
  end
end