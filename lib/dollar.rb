class Dollar < ActiveRecord::Base
    belongs_to :user
    def self.user
end
