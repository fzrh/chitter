require 'dm-timestamps'

class Peep

	include DataMapper::Resource

	belongs_to :maker

	property :id, 			Serial
	property :created_at, 	Time
	property :created_on, 	Date
	property :message, 		Text

end