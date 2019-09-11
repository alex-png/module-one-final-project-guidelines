class Venue < ActiveRecord::Base
    has_many :genres
    has_many :bookings
    has_many :bands, through: :bookings
    belongs_to :venue_name
    belongs_to :user
    
end
