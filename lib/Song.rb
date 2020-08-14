require 'pry'

class Song

    attr_accessor :name, :genre, :artist

    @@all = []
    def initialize (name, artist=nil, genre=nil)
        @name = name
        save
        @artist = artist if artist
        @genre = genre if genre
    end

    def self.all
        @@all
    # binding pry

    end

    def self.destroy_all
        self.all.clear
    end

    def save
        self.class.all << self
    end

    def self.create(name)
        song = Song.new(song)
        song
    end
    def add_song(songs)
       
        
    end

end