class Match < ActiveRecord::Base
        attr_accessible :request_id, :book_id
        belongs_to :book
        belongs_to :request
end

