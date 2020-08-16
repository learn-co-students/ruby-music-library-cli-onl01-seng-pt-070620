class Artist
    extend Concerns::Findable

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        new_artist = self.new(name)
        new_artist.save
        new_artist
    end

    def songs
        @songs
    end

    def add_song(song)
        if song.artist == nil
            song.artist = self
        else
            nil
        end
        if songs.include?(song)
            nil
        else
            @songs << song
        end
    end
    
    def genres
        @genre_array = []
        @songs.each do |song|
            if @genre_array.include?(song.genre)
                nil
            else
                @genre_array << song.genre
            end
        end
        @genre_array
    end
end