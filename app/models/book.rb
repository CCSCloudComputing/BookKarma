class Book < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :author, :image, :isbn, :title
=======
  attr_accessible :author, :title, :isbn, :image_address #, :owner

validates :isbn, presence: true, length: {maximum:17}

validates_presence_of :title, :author, :image_address #,:owner



>>>>>>> master
end
