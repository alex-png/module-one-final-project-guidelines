class User < ActiveRecord::Base
    has_many :artists
    has_many :venues
    has_many :genres
    

    def self.names
        self.all.pluck(:name)
    end
    def self.current
        @@current
    end

    def self.current=(user)
        @@current = user
    end

end

