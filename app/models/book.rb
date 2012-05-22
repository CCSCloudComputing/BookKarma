class Book < ActiveRecord::Base
  attr_accessible :author, :owner_username, :title, :isbn, :image_address
end
