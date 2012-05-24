class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :points, :username
end
