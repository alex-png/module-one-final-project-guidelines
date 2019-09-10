class Artist < ActiveRecord::Base
    has_many :bookings
    has_many :venues, through: :bookings
    
    def self.names
        self.all.pluck(:name)
    end
    def self.genres
        self.all.pluck(:genre)
    end
    def self.user_ids
        self.all.pluck(user:id)
    end
end
