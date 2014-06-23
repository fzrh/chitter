require 'dm-timestamps'

class Peep

	include DataMapper::Resource

	belongs_to :maker

	property :id, 			Serial
	property :created_at, 	DateTime
	property :message, 		Text

end