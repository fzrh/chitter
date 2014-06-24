class Peep

	include DataMapper::Resource

	belongs_to :maker
	has n, :replies

	property :id, 			Serial
	property :created_at, 	Time
	property :created_on, 	Date
	property :message, 		Text, :required => true, :message => 'You did not peep anything' 

end