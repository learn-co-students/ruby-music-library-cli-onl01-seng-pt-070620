require 'pry'

class Genre

    attr_accessor :name, :songs, :artist
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
        genre = Genre.new(name)
        genre
        # binding pry
    end

    def add_song(song)
        @songs << song unless songs.include?(song)
        song.genre = self unless song.genre
    end

    def artists
        songs.collect {|song| song.artist}.uniq
    end

end