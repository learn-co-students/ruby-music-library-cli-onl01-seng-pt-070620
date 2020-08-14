require 'pry'

class Song

    attr_accessor :name, :genre, :artist

    @@all = []
    def initialize (name, artist=nil, genre=nil)
        @name = name
        save
        self.artist=(artist) if artist
        self.genre=(genre) if genre
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
        song = Song.new(song)
        song
    end
    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self)
    end

    def self.find_by_name(name)
        @@all.find {|song| song.name == name}
    end

end