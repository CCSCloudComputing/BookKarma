class Book < ActiveRecord::Base
  attr_accessible :author, :image, :isbn, :title
end
