require './lib/person'
require './lib/bike'


describe Person do

let(:person) {Person.new('Srikanth')}

  it 'should have first name equal to input' do
  	# john = Person.new("John")
  	person.name.should == 'Srikanth'
  end

  it 'should have a unique id' do
  	srik = Person.new("Srik")
  	will = Person.new("Will")
  	srik.id != will .id
  end

  it 'should have no bike initially' do
	# john = Person.new("John")
		person.bike.should == nil
  end

  it 'should get a bike once it is rented' do
  # john = Person.new("John")
  bike = Bike.new
    person.rents(bike)
    person.bike.should == bike
  end

  it 'should return bike' do
  # john = Person.new("John")
  bike = Bike.new
    person.rents(bike)
    person.returns_bike
    person.bike.should == nil
  end
end