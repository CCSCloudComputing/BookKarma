class Book < ActiveRecord::Base
  attr_accessible :author, :course, :isbn, :title, :url
end
