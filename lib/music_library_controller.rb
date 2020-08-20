#require_relative "../config/environment.rb"
class MusicLibraryController 
    def initialize(path= "./db/mp3s")
        mi = MusicImporter.new(path)
        mi.import
    end
    def call
        input = gets.strip 
        if input != exit 

        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        end 
    end 
        # def list_songs 
        #     Song.all.sort {|a,b| a.name <=> b.name}.each_with_index do |s,i| 
        #         puts " #{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
        #     end
        # end 
    #end  
end 