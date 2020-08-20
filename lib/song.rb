#require_relative "../config/environment.rb"
require 'pry'
class Song 
    @@all = []
    attr_accessor :name
    def initialize(name, artist= nil, genre= nil)
        @name= name
        
        if artist != nil 
            self.artist = artist 
        end 
        if genre != nil 
            self.genre= genre 
        end 
       
        #@artist= artist
        save 
    end 
    def artist 
        @artist 
    end 
    def artist=(artist)
        @artist= artist
        artist.add_song(self) 
    end 

    # def genre=(genre)
    #     @genre= genre
    #     genre.add_song(self)
    # end 
    def genre 
        @genre 
    end 
    def genre=(genre)
        @genre= genre
        if genre != nil && !genre.songs.include?(self)
            @genre.songs << self 
        end 
        
        #genre.add_song(self)
    end 
    def save
        @@all << self  
    end 
    def self.all 
        @@all 
    end 
    def self.destroy_all 
        self.all.clear 
    end 
    def self.create(name)
        self.new(name)
    end 
    def self.find_by_name(name )
        self.all.detect {|song| song.name == name }
    end 
    def self.find_or_create_by_name(name)
        #self.find(name) ? self.find(name) : self.new(name) 
        self.find_by_name(name) || self.create(name)   
    end 
    def self.new_from_filename(filename)
        filename = filename.split(" - ")
        # artist = Artist.find_or_create_by_name(filename[0])
        # genre = Genre.find_or_create_by_name(filename[2].split(".")[0])
        # Song.new(filename[1], artist, genre)
        artist_name, song_name, genre_name = filename.first, filename[1], filename[2].split(".")[0]
        #binding.pry
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
        self.new(song_name, artist, genre)

    end 
    def self.create_from_filename(filename)
        self.new_from_filename(filename)
        #binding.pry 


    end 
end 