require './lib/person'
require './lib/bike'
require './lib/station'

describe Person do

let(:person) {Person.new('Srikanth')}
let(:station) {Station.new('Old Street')}

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
    station.bikes_daily_setup
    person.rent(station)
    person.bike.should_not eq nil
  end

  it 'should not have a bike once it is returned' do
    station.bikes_daily_setup
    person.return_bike(station)
    person.bike.should eq nil
  end

  it 'should have the same bike object that was at the station' do
    station.bikes_daily_setup
    object = station.bicycles.first
    person.rent(station)
    person.bike.should eq object
  end

  it 'should have a one in six chance of breaking the bike' do
    station.bikes_daily_setup
    person.rent(station)
    Kernel.stub(:rand).and_return( 6 )
    person.cycle_to(station)
    person.bike.broken? == true 
  end

  it 'should have a five in six chance of not breaking the bike' do
    station.bikes_daily_setup
    person.rent(station)
    Kernel.stub(:rand).and_return( 1..5 )
    person.cycle_to(station).should eq "You reached #{station}!"
    person.bike.broken? == false
  end

  it 'should return bike if it wants to' do
    station.bikes_daily_setup
    person.rent(station)
    person.bike.should_not eq nil
    station.bicycles.count == 24
    person.want_to_return_bike?(station, "yes")
    person.bike.should eq nil
    station.bicycles.count == 25
  end

  it 'should return a broken bike if broken' do
    station.bikes_daily_setup
    person.rent(station)
    Kernel.stub(:rand).and_return( 6 )
    person.cycle_to(station)
    person.with_a_broken_bike(station)
    bike = station.bicycles.last
    bike.broken? == true
  end
end