class User < ActiveRecord::Base

attr_accessible :username, :email, :password, :password_confirmation

has_secure_password

valid_email_regex = /\A[\w+\-.]+@umail\.ucsb\.edu/

validates_presence_of :username, :password, :email



before_save :generate_auth_token



private

def generate_auth_token
	self.auth_token = SecureRandom.urlsafe_base64
end


end
