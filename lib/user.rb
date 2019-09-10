class User < ActiveRecord::Base
    has_many :artists
    has_many :venues
    has_many :genres
    has_many :dollar

    def self.names
        self.all.pluck(:name)
    end
end
