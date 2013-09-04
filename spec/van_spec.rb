require './lib/van'

class Van

	describe Van do

let(:van) {Van.new}

    it 'should initialise with a broken_bikes array' do
      van.broken_bikes == []
    end

    it 'should initialise with a fixed_bikes array' do
      van.fixed_bikes == []
    end


		it 'should collect broken bikes' do
      station = double(:station, {broken_bicycles: Array.new(10, "bike")})
      van.take_broken_bikes(station)

      van.broken_bikes.count.should == 10
		end

    it 'should only collect broken bikes' do
      station = double(:station, {
        broken_bicycles: Array.new
      })

      van.take_broken_bikes(station)
      van.broken_bikes.count.should == 0
    end

    it 'should deliver broken bikes' do
      garage = double(:garage, {
        takes_bikes_from_van: Array.new
      })

      van.deliver_broken_bikes(garage)
      van.broken_bikes.count.should == 0
    end 

    it 'should collect fixed bikes' do
      garage = double(:garage, {
        return_fixed_bikes: Array.new(10,"bike")
      })

      van.takes_fixed_bikes(garage)
      van.fixed_bikes.count.should == 10
    end

    it 'should not collect broken bikes from garage' do
      garage = double(:garage, {
        return_fixed_bikes: []
      })

      van.takes_fixed_bikes(garage)
      van.fixed_bikes.count.should == 0
    end

    it 'should return fixed bikes' do
      station = double(:station, { 
        takes_bikes_from_van: Array.new
      })

      van.deliver_fixed_bikes(station)
      van.fixed_bikes.count.should == 0
    end
  end

end