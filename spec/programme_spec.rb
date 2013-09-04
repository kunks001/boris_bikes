require './lib/station'
require './lib/bike'
require './lib/person'
require './lib/van'
require './lib/garage'

describe "Programme" do
	let(:station) {Station.new("Old Street")}
  let(:person) {Person.new("Srikanth")}
  let(:bike) {Bike.new}
  let(:van) {Van.new}
  let(:garage) {Garage.new}
  let(:station2) {Station.new("Kings Cross")}

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

  it 'lets the station take only the fixed bikes from the van' do
    array = Array.new(2,Bike.new)
    van.instance_variable_set(:@fixed_bikes, array)

    station.takes_bikes_from_van(van)
    station.bicycles.count.should == 27
  end


  it 'lets a person return a bike at any station that has space' do
    person.rent(station)
    person.return_bike(station2)

    station.bicycles.count == 24
    station2.bicycles.count == 26
    person.bike == nil
  end
end