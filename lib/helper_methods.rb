require_relative '../config/environment'
require 'rest_client'
require "pry"
### API Methods ###
def format_artist_name_for_html(name)
    name.tr(' ', '+')
end
def get_discogs_id(artist)
    i = 0
    formatted_name = format_artist_name_for_html(artist)
    response = RestClient.get "https://api.discogs.com/database/search?q=#{formatted_name}&key=RQiVIFhlSQUaqhURPhaW&secret=VHJtTwzPjtlEZUmGvUvdoAHlLaBzsqQv"
    results_hash = JSON.parse(response)
    until results_hash["results"][i]["type"] == 'artist'
        i += 1
    end
    results_hash["results"][i]["id"]
end
def get_genre(artist)
    artist_id = get_discogs_id(artist)
    response = RestClient.get "https://api.discogs.com/artists/#{artist_id}/releases"
    results_hash = JSON.parse(response)
    response2 = RestClient.get results_hash['releases'][0]['resource_url']
    results_hash2 = JSON.parse(response2)
    genre = results_hash2["genres"][0]
    genre
end
def get_band_members(artist)
    return_array = []
    artist_id = get_discogs_id(artist)
    response = RestClient.get "https://api.discogs.com/artists/#{artist_id}"
    results_hash = JSON.parse(response)
    if results_hash['members']
        active_array = results_hash['members'].select{|member|member["active"] == true}
        member_array = active_array.map{|member|member["name"]}
        member_array.map!{|member|member.tr('()0-9', '').strip}
        member_array.map{|member|member.split(/ |\_/).map(&:capitalize).join(" ")}
    elsif results_hash['realname']
        name = results_hash['realname']
        return_array << name.split(/ |\_/).map(&:capitalize).join(" ")
    elsif results_hash['aliases']
        name = results_hash['aliases'][0]['name']
        return_array << name.split(/ |\_/).map(&:capitalize).join(" ")
    else 
        name = artist.split(/ |\_/).map(&:capitalize).join(" ")
        return_array << name
    end 
end
###start up###
def create_new_user(name)
    User.create(name: name)
end
def new_game
    puts "Please enter your name"
    user = gets.chomp
    while User.names.include?(user)
        puts 'Sorry, that name is already taken, please enter another'
        user = gets.chomp
    end
    User.current = create_new_user(user)
end
def start_menu
    puts 'Type the number for what you want to do!'
    puts '*' * 25
    puts '1 - New Game'
    puts '2 - Load Save File'
    puts '3 - Delete Save File'
    input = gets.chomp  
    until input == '1' || input == '2' || input == '3'
        puts 'Please enter 1, 2 or 3'
        input = gets.chomp
    end
    if input == '1'
        new_game
    elsif input == '2'
        load_game
    elsif input == '3'
        delete_save
    end
end
def load_game
    puts "Still in development"
    start_menu
end
def delete_save
    puts "Still in development"
    start_menu
end
### Populate Data ###
def hire_act
    act = gets.chomp
    act_genre = get_genre(act)
    new_artist = Artist.create(name: act.split(/ |\_/).map(&:capitalize).join(" "), genre: act_genre, user_id: User.current.id)
    Genre.create(name: act_genre, user_id: User.current.id)
    add_band_members(new_artist)
    new_artist
end
def add_band_members(artist)
    band_members = get_band_members(artist.name)
    band_members.each do |member|
        BandMember.create(name: member, artist_id: artist.id)
    end
end
def new_venue_name_checker
    name = VenueName.names.sample
    if User.current.venues.any?{|venue| venue.name == name} == true
        while User.current.venues.any?{|venue| venue.name == name} == true
            name = VenueName.names.sample
        end
    end
    name
end
def generate_venue
    venue_name = new_venue_name_checker
    new_venue = Venue.create(name: venue_name, user_id: User.current.id)
    add_genre_to_venue(new_venue)
    new_venue
end
def add_genre_to_venue(venue)
    genre = User.current.genres.last
    genre.venue_id = venue.id
    genre.save
end
def create_booking(artist, venue, date=random_date)
    Booking.create(artist_id: artist.id, venue_id: venue.id, date: date)
end
## User inputs artist ##
def treat_input_as_artist
    puts "Please enter an artist"
    input = gets.chomp.downcase.split(/ |\_/).map(&:capitalize).join(" ")
    Artist.find_by name: input, user_id: User.current.id
end
def check_artist_genre_is_right_for_venue(artist, venue)
    if artist == nil
        1 ##User has no artists with the same name as input##
    else
        genre_names = venue.genres.map{|genre|genre.name}
        if genre_names.include?(artist.genre)
            2 ##Correct Answer##
        else 
            3 ##Artist does not have correct genre##
        end
    end
end
def fire_act(artist)
    Artist.destroy(input.id)
end
def check_band_member_is_in_band(artist, band_member)
    if artist == nil
        1 ##User has no artists with the same name as input##
    else
        if artist.band_members.include?(band_member)
            2 ##Correct Answer##
        else
            3 ##Artist does not have this band member##
        end
    end
end
def check_artist_is_right_for_date(artist, venue, date)
    if artist == nil
        1 ##User has no artists with the same name as input##
    else
        bookings_on_date = artist.bookings.select{|booking|booking.date == date}
        if bookings_on_date.length > 0
            if bookings_on_date.map{|booking|booking.venue_id}.include?(venue.id)
                2 ##Correct Answer##
            else
                3 ##venue is not booked for artist on that date##
            end
        else
            4 ##artist has no bookings at that date##
        end
    end
end
##User inputs venue##
def treat_input_as_venue
    input = gets.chomp.downcase.split(/ |\_/).map(&:capitalize).join(" ")
    Venue.find_by name: input, user_id: User.current.id
end
def check_artist_is_booked_at_venue(venue, artist)
    if venue == nil
        1 ##User has no artists with the same name as input##
    else
        if artist.bookings.any?{|booking|booking.venue_id == venue.id}
            2 ## Correct Answer ##
         else
            3 ##Artist has no bookings at venue##
         end
    end
end
def check_venue_is_right_for_date(venue, artist, date)
    if venue == nil
        1 ##Save file has no venues with the same name as input##
    else
        bookings_on_date = venue.bookings.select{|booking|booking.date == date}
        if bookings_on_date.length > 0
            if bookings_on_date.map{|booking|booking.artist_id}.include?(artist.id)
                2 ##Correct Answer##
            else
                3 ##Artist is not booked at venue on that date##
            end
        else
            4 ##Venue has no bookings at that date##
        end
    end
end
## Misc ##
def random_date
    (Date.today+rand(15)).to_s
end
    puts "HELLO WORLD"
#################

def welcome_message
    puts "Welcome to EXTREME BAND MANAGER, #{User.current.name}! Your task is to get rich by managing as many bands as you possibly can...or die trying!"
end
#####################
# chek_if_user_has_genres