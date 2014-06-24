require 'dm-timestamps'

class Reply 

  include DataMapper::Resource

  belongs_to :maker
  belongs_to :peep

  property :id, 			Serial
  property :created_at, 	Time
  property :created_on, 	Date
  property :message, 		Text, :required => true, :message => 'You did not peep a reply' 

end