require 'bcrypt'
require 'dm-validations'

class Maker

  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true
  property :username, String, :required => true, :unique => true, :message => 'This username is already in use'
  property :email, String, :required => true, :unique => true, :message => 'This email has already been registered'
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