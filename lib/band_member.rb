class BandMember < ActiveRecord::Base
belongs_to :artist
    def self.names
        self.all.pluck(:name)
    end
    def self.band_ids
        self.all.pluck(:band_id)
    end
end
