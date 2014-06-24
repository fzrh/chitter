require 'bcrypt'

class Maker

  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true
  property :username, String, :required => true, :unique => true, :messages => { :is_unique => "This username is already in use" }
  property :email, String, :required => true, :unique => true, :format => :email_address, :messages => { :presence  => "We need your email address", :is_unique => "We already have that email", :format => "Doesn't look like a valid email" }
  #property :email, String, :required => true, :unique => true, :format => :email_address
  property :password_digest, Text

  has n, :peeps

  def password=(password)
  	@password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, :message => 'Sorry, your passwords do not match'
  validates_length_of :password, :min => 5

  def self.authenticate(username, password)
    maker = first(:username => username)
    if maker && BCrypt::Password.new(maker.password_digest) == password
      maker
    else
      nil
    end
  end

end