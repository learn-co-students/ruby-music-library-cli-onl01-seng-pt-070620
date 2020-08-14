require 'pry'
class Artist

    attr_accessor :name, :songs
    extend Concerns::Findable


    @@all = []

    
    def initialize(name)
        @name = name
        save
        @songs = []
        
    end

    def self.all
        @@all
        # binding pry
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self

    end

    def self.create(name)
        # binding pry
        artist = Artist.new(name) 
        artist
    end

    def add_song(song)
        @songs << song unless songs.include?(song)
        song.artist = self unless song.artist
    end

    def genres
        songs.collect {|song| song.genre}.uniq
    end

end