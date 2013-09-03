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
end