require 'bcrypt'

class User
  include Mongoid::Document

  attr_accessor :password

  field :username, type: String
  field :salt, type: String
  field :hashed_password, type: String
  has_many :ideas
  
  include BCrypt

  before_save :hash_stuff

  def authenticated? password
  	self.hashed_password ==
  		BCrypt::Engine.hash_secret(password, self.salt)
  end

  private

  	def hash_stuff
  		self.salt = BCrypt::Engine.generate_salt
  		self.hashed_password =
  			BCrypt::Engine.hash_secret self.password, self.salt
  		self.password = nil
  	end

end
