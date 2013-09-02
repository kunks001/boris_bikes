require './boris_bikes'




	describe Person do

	let(:person){Person.new('Srikanth', 'Kunkulagunta')}

	expect(:person.first_name).to eq 'Srikanth'
	end