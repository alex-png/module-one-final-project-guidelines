class Booking < ActiveRecord::Base
    belongs_to :artist
    belongs_to :venue

end
