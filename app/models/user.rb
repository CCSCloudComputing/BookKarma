class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :points, :username, :books


has_secure_password

valid_email_regex = /\A[\w+\-.]+@umail\.ucsb\.edu/

validates_presence_of :username, :password, :email
validates_uniqueness_of :username, :email



before_save :generate_auth_token


has_many :books  



private

def generate_auth_token
	self.auth_token = SecureRandom.urlsafe_base64
end

end
