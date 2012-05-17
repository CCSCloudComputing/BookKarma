class Book < ActiveRecord::Base
  attr_accessible :author, :owner_id, :title
end
