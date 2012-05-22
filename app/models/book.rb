class Book < ActiveRecord::Base
  attr_accessible :author, :owner, :title, :isbn, :image_address

validates :isbn, presence: true, length: {maximum:17}

validates_presence_of :owner, :title, :author, :image_address



end
