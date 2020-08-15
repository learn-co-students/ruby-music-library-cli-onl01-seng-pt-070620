require "pry"
class MusicLibraryController
    attr_accessor :path, :musicimporter, :song, :artist, :genre

    def initialize(path="./db/mp3s")
        @path = path
        thePath = MusicImporter.new(path)
        thePath.import
    end

    def call
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        input
    end


    def input
        action = ""
        while action != "exit"
        action = gets.strip
        case action
        when "list songs"
           list_songs
        when "list artists" 
          list_artists 
           input
        when "list genres"
           list_genres
           input
        when "list artist"
           list_songs_by_artist
           input
        when "list genre"
           list_songs_by_genre
           input
        when "play song"
            play_song
            input   
        end     
        end
    end

    def list_songs
        counter = 1
        sorted = Song.all.sort_by do |song| 
        song.name
        end
        sorted.each do |song|
            puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
            counter += 1
        end
    end

    def list_artists
        counter = 1
        sorted = Artist.all.sort_by do |artist| 
        artist.name
        end
        sorted.each do |artist|
            puts "#{counter}. #{artist.name}"
            counter += 1
        end

    end

    def list_genres
        counter = 1
        sorted = Genre.all.sort_by do |genre| 
            genre.name
        end
        sorted.each do |genre|
            puts "#{counter}. #{genre.name}"
            counter += 1
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        requestedArtist = gets.strip
        counter = 1
        sorted = Song.all.sort_by do |song| 
            song.name
        end
        sorted.each do |song|
            if requestedArtist == song.artist.name
                puts "#{counter}. #{song.name} - #{song.genre.name}"
                counter += 1
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        requestedGenre = gets.strip
        counter = 1
        sorted = Song.all.sort_by do |song| 
            song.name
        end
        sorted.each do |song|
            if requestedGenre == song.genre.name
                puts "#{counter}. #{song.artist.name} - #{song.name}"
                counter += 1
            end
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        counter = 1
        sorted = Song.all.sort_by do |song| 
        song.name
        end
        highestNumber = Song.all.length
        songRequest = gets.strip.to_i 
        if (1..highestNumber).include?(songRequest)
            song = sorted[songRequest-1]
            puts "Playing #{song.name} by #{song.artist.name}"
         end
    end
end


