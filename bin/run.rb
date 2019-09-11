require_relative '../config/environment'
require 'pry'
ActiveRecord::Base.logger.level = 1 


start_menu
welcome_message
unless User.current.artists.size > 4
    level_1
end

unless User.current.artists.size > 8 
    level_2 
end

unless User.current.artists.size > 12
    level_3
end

end_message


# User.current = login
# game_start

# add_genre_to_venue(ven1)
# puts "Looks like you're getting your first call."
# puts "Hey, it's #{User.current.venues.all.sample.name}. We mostly play #{ven1.genres}. Have you got anything for us? Y/N"
# response = gets.chomp.downcase

