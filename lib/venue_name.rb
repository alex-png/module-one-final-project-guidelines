class VenueName < ActiveRecord::Base 
    has_many :venues
    def self.names
        self.all.pluck(:name)
    end

end
