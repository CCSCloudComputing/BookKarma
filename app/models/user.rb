require 'digest/sha1'
 
class User < ActiveRecord::Base
 # has_many :tweets
  validates_uniqueness_of :username
  
  def self.authenticate(uname, pass)
    user = User.find_by_username(uname)
    if user 
      if hash_pass(pass, user.salt) == user.password
        user
      else
        raise ApplicationHelper::AuthError.new "Password sucks!"
      end
    else
      raise ApplicationHelper::AuthError.new "No such username!"
    end
  end
  
  def home_page
    "/@/#{username}"
  end
  
  def password=(pass)
    self.salt = random_string(16)
    self[:password] = hash_pass(pass, salt)  
  end
  
  def self.hash_pass(pass, salt) 
    Digest::SHA1.hexdigest(pass + salt)
  end
    
  def random_string(n)
    n.times.map { Random.rand(128).chr }.inject { |x, y| x + y }
  end
  
  attr_accessible :username, :name, :salt, :password
end
