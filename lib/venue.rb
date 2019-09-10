class Venue < ActiveRecord::Base
    has_many :bookings
    has_many :bands, through: :bookings
    belongs_to :venue_name
end
