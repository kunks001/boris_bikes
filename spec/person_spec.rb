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
  end



  # it 'should not be able to rent more than one bike' do
  #   bike = Bike.new
  #   bike = Bike.new
  #   person.rents
  #   person.rents.should eq "You've already got a bike!"
  # end

  # it 'breaks bike' do
  #   bike = Bike.new
  #   person.rents
  #   person.breaks_bike
  #   bike.broken? == true
  # end

  # it 'should return bike' do
  # # john = Person.new("John")
  # bike = Bike.new
  #   person.rents(bike)
  #   person.returns_bike
  #   person.bike.should == nil
  # end
end