require_relative '../config/environment'
require 'rest_client'
require "pry"

def format_artist_name_for_html(name)
    name.tr(' ', '+')
end

# def get_genre(artist)
#     i = 0
#     formatted_name = format_artist_name_for_html(artist)
#     response = RestClient.get "https://api.discogs.com/database/search?q=#{formatted_name}&key=RQiVIFhlSQUaqhURPhaW&secret=VHJtTwzPjtlEZUmGvUvdoAHlLaBzsqQv"
#     results_hash = JSON.parse(response)
#     until results_hash["results"][i]["style"]
#         i += 1
#     end
#     p results_hash["results"][i]["style"][0]
# end



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
    p genre
end

def get_band_members(artist)
    return_array = []
    artist_id = get_discogs_id(artist)
    response = RestClient.get "https://api.discogs.com/artists/#{artist_id}"
    results_hash = JSON.parse(response)
    if results_hash['members']
        active_array = results_hash['members'].select{|member|member["active"] == true}
        member_array = active_array.map{|member|member["name"]}
        p member_array.map{|member|member.tr('()0-9', '').strip}
    elsif results_hash['realname']
        name = results_hash['realname']
        p return_array << name
    elsif results_hash['aliases']
        name = results_hash['aliases'][0]['name']
        return_array << name
    else 
        name = artist
        return_array << name
    end 
end

get_band_members('mf doom')
get_genre('mf doom')


puts "HELLO WORLD"

##helper methods##
def create_new_user(name)
    User.create(name: name)
end

def login
    user = gets.chomp
    if User.names.include?(user)
        User.find_by name: user
    else 
        create_new_user(user)
    end
end

#user = login

def hire_act
    act = gets.chomp
    act_genre = get_genre(act)
    new_artist = Artist.create(name: act.capitalize, genre: act_genre, user_id: user.id)
    Genre.create(title: act_genre, user_id: user.id)
    add_band_members(new_artist)
    new_artist
end

def add_band_members(artist)
    band_members = get_band_members(act)
    band_members.each do |member|
        BandMember.create(name: member, artist_id: artist.id)
    end
end

# def new_venue_name_checker
#     name = VenueName.names.sample
#     while user.venues.any?(|venue| venue.name == 'name') 
#         name = VenueName.names.sample
#     end
# end

def generate_venue
    venue_name = new_venue_name_checker
        new_venue = Venue.create(name:venue_name)
    add_genre_to_venue(new_venue)
end

def add_genre_to_venue(venue)
    user.genres.sample.venue_id = venue.id
end

def fire_act(name)
    act_to_be_fired = Artist.find_by name: name, user_id: user.id
    Artist.destroy(act_to_be_fired.id)
end

def treat_input_as_artist
    input = gets.chomp.downcase.capitalize
    Artist.find_by name: input, user_id: user.id
end

def check_artist_genre_is_right_for_venue(venue)
    artist = treat_input_as_artist
    if artist == nil
        nil
    else
        venue.genres.include?(artist.genre)
    end
end
