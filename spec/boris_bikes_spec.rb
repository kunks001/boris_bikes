require './lib/person'

describe Person do

# let(:person) {Person.new(Srikanth)}

  it 'should have first name equal to input' do
  	john = Person.new("John")
  	john.name.should == 'John'
  end

  it 'should have a unique id' do
  	srik = Person.new("Srik")
  	will = Person.new("Will")
  	srik.id != will .id
  end

  it 'should have no bike initially' do
	john = Person.new("John")
		john.bike.should == 0
	end

  it 'should have no bike initially' do
  john = Person.new("John")
    john.gets_bike
    john.bike.should == 1
  end

  it 'should return bike' do
  john = Person.new("John")
    john.gets_bike
    john.returns_bike
    john.bike.should == 0
  end
end