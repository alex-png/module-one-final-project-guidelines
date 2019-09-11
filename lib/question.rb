require "pry"
class EasyQuestion
    def self.q0
        v1 = User.current.venues.all.sample
        puts "Hey, it's #{v1.name}. We mostly play #{v1.genres.map do |genre| genre.name end.join(" and ") }. Who have you got for us?"
        artist = treat_input_as_artist
        a = check_artist_genre_is_right_for_venue(artist, v1)
    
        if a == 1 
            puts "You don't actually manage them, do you? 🤬"
            puts "**********"
            puts "- $10.00"
            puts "**********" 
        elsif a == 2 

            date = random_date

            puts "Wow. You are the best band manager. I'll book you in for #{date}! DON'T FORGET THE DATE! ~EXTREME!~"
            puts "**********"
            puts "+ $10.00"
            puts "**********" 
            local_booking = create_booking(artist, v1, date)
        elsif a == 3 
            puts "They're not the right genre, doofus."
            puts "**********"
            puts "- $10.00"
            puts "**********" 
        end
    end

    def self.q1 
        v1 = User.current.venues.all.sample
        
        puts "Hey, it's #{v1.name}. We mostly play #{v1.genres.map do |genre| genre.name end.join(" and ") }. For future reference, do any of your artists play that?"
        #User.all.last.genres.include?(Venue.all.last.genres[0])
    
        if a == 1 
            puts "You don't actually manage them, do you? 🤬"
            puts "**********"
            puts "- $10.00"
            puts "**********" 
        elsif a == 2 
            date = random_date

            puts "Wow. You are the best band manager. I'll book you in for #{date}! DON'T FORGET THE DATE! ~EXTREME!~"
            puts "**********"
            puts "+ $10.00"
            puts "**********" 
            create_booking(artist, v1, date)
        elsif a == 3 
            puts "They're not the right genre, doofus."
            puts "**********"
            puts "- $10.00"
            puts "**********" 
        end
    end

    def self.q2 
        v1 = User.current.venues.all.sample
        puts "Hey, it's #{v1.name}. We mostly play #{v1.genres.map do |genre| genre.name end.join(" and ") }. Who have you got for us?"
        artist = treat_input_as_artist
        a = check_artist_genre_is_right_for_venue(artist, v1)
    
    
        if a == 1 
            puts "You don't actually manage them, do you? 🤬"
            puts "**********"
            puts "- $10.00"
            puts "**********" 
        elsif a == 2 
            date = random_date

            puts "Wow. You are the best band manager. I'll book you in for #{date}! DON'T FORGET THE DATE! ~EXTREME!~"
            puts "**********"
            puts "+ $10.00"
            puts "**********" 
            create_booking(artist, v1, date)
        elsif a == 3 
            puts "They're not the right genre, doofus."
            puts "**********"
            puts "- $10.00"
            puts "**********" 
        end
    end

    def self.q3 
        v1 = User.current.venues.all.sample
        puts "Hey, it's #{v1.name}. We mostly play #{v1.genres.map do |genre| genre.name end.join(" and ") }. Who have you got for us?"
        artist = treat_input_as_artist
        a = check_artist_genre_is_right_for_venue(artist, v1)
    
    
        if a == 1 
            puts "You don't actually manage them, do you? 🤬"
            puts "**********"
            puts "- $10.00"
            puts "**********" 
        elsif a == 2 
            date = random_date

            puts "Wow. You are the best band manager. I'll book you in for #{date}! DON'T FORGET THE DATE! ~EXTREME!~"
            puts "**********"
            puts "+ $10.00"
            puts "**********" 
            create_booking(artist, v1, date)
        elsif a == 3 
            puts "They're not the right genre, doofus."
            puts "**********"
            puts "- $10.00"
            puts "**********" 
        end
    end

    def self.q4 
        v1 = User.current.venues.all.sample
        puts "Hey, it's #{v1.name}. We mostly play #{v1.genres.map do |genre| genre.name end.join(" and ") }. Who have you got for us?"
        artist = treat_input_as_artist
        a = check_artist_genre_is_right_for_venue(artist, v1)
    
    
        if a == 1 
            puts "You don't actually manage them, do you? 🤬"
            puts "**********"
            puts "- $10.00"
            puts "**********" 
        elsif a == 2 
            date = random_date

            puts "Wow. You are the best band manager. I'll book you in for #{date}! DON'T FORGET THE DATE! ~EXTREME!~"
            puts "**********"
            puts "+ $10.00"
            puts "**********" 
            create_booking(artist, v1, date)
        elsif a == 3 
            puts "They're not the right genre, doofus."
            puts "**********"
            puts "- $10.00"
            puts "**********" 
        end
    end


    array = [0,1,2,3]
    

    def self.random
        self.send("q#{(rand(4))}")
    end

end

# def level_1
#     3 times do 
#         EasyQuestion.random
#     end
# end


def level_1
    
   puts "Input a band/artist you'd like to manage."
    hire_act
    generate_venue

   puts "Input another band/artist you'd like to manage."
    hire_act
    generate_venue
   puts "Input another band/artist you'd like to manage."
    hire_act
    generate_venue
    puts "Okay! Here come your tasks📞"
    3.times do
        EasyQuestion.random
    end
end



