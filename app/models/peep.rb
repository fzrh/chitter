class Peep

	include DataMapper::Resource

	belongs_to :maker

	property :id, Serial
	property :message, Text

end