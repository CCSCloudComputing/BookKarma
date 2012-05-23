class Book < ActiveRecord::Base
  attr_accessible :author, :title, :isbn, :image_address, :owner

validates :isbn, presence: true, length: {maximum:17}

validates_presence_of :title, :author, :image_address,:owner



end
